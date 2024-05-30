#!/bin/bash

# Define RMAN backup script path
RMAN_SCRIPT="/path/to/rman_backup_script.rman"

# Define log file path
LOG_FILE="/path/to/logs/rman_backup_$(date +'%Y%m%d_%H%M%S').log"

# Run the RMAN backup script and direct output to log file
rman target / <<EOF > $LOG_FILE 2>&1
@${RMAN_SCRIPT}
EOF

# Check the RMAN log file for success or errors
if grep -q "RMAN-03009: failure" $LOG_FILE; then
  echo "RMAN backup failed. Check the log file: $LOG_FILE"
else
  echo "RMAN backup completed successfully. Log file: $LOG_FILE"
fi
