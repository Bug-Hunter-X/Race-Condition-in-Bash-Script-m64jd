# Race Condition in Bash Script

This repository demonstrates a classic race condition bug in a bash script and its solution using a lock file.

## Bug Description
The `bug.sh` script attempts to increment a counter using multiple concurrent processes.  Due to the lack of synchronization, the final count is often incorrect.

## Solution
The `bugSolution.sh` script addresses the race condition by employing a lock file to ensure that only one process accesses and updates the counter at a time.