#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter.
increment_count() {
  local prev_count=$count
  sleep 0.1  # Simulate some work
  count=$((prev_count + 1))
}

# Create multiple processes to increment the counter simultaneously.
for i in {1..5}; do
  increment_count & 
done

# Wait for all processes to complete.
wait

# Print the final counter value.
echo "Final count: $count"