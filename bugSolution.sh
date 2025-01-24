#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="/tmp/counter.lock"

# Function to increment the counter safely using a lock.
increment_count() {
  flock $lock_file
  local prev_count=$count
  sleep 0.1  # Simulate some work
  count=$((prev_count + 1))
  echo "count updated to: $count" >> /tmp/counter.log
  flock -u $lock_file
}

# Create multiple processes to increment the counter simultaneously.
for i in {1..5}; do
  increment_count &
done

# Wait for all processes to complete.
wait

# Print the final counter value.
echo "Final count: $count"
cat /tmp/counter.log