#!/bin/bash

# Unlock /etc/hosts if locked
sudo chattr -i /etc/hosts

# Get the full path of the current script
SCRIPT_PATH="$(realpath "$0")"
# Define the log file path dynamically based on the script's location and name
LOG_FILE="$(dirname "$SCRIPT_PATH")/$(basename "$SCRIPT_PATH" .sh).log"

# Define the cron job command with dynamic script path and redirection to the log file
CRON_JOB="* * * * * /bin/bash $SCRIPT_PATH >> $LOG_FILE 2>&1"

# Redirect all script output to the log file from this point on
exec >> "$LOG_FILE" 2>&1

# Check if the entry exists in the /etc/hosts file
if ! grep -q "127.0.0.1 api.virtualizor.com" /etc/hosts; then
    # If the entry doesn't exist, append both lines to the /etc/hosts file
    echo "[$(date)] Adding entries to /etc/hosts..."
    echo '127.0.0.1 www.virtualizor.com
127.0.0.1 api.virtualizor.com' | sudo tee -a /etc/hosts
    
    # Perform operations on license2.php
    sudo chattr -i /usr/local/virtualizor/license2.php
    sudo rm -rf /usr/local/virtualizor/license2.php 
    sudo wget -qO /usr/local/virtualizor/license2.php https://raw.githubusercontent.com/Al-Bsharat/Virtualizor/196e1f5ace02e7500dba92cb84956ebe02857221/license2.php
    sudo chattr +i /usr/local/virtualizor/license2.php
    
    echo "[$(date)] [+] Crack applied successfully."
else
    echo "[$(date)] The required entry already exists in /etc/hosts. No further actions taken."
fi

# Check if the cron job is already scheduled
if ! crontab -l | grep -Fq -- "$SCRIPT_PATH"; then
    # If the cron job isn't scheduled, add it
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "[$(date)] Cron job added successfully."
else
    echo "[$(date)] Cron job already exists. No further actions taken."
fi

# Lock /etc/hosts
sudo cp -a /etc/hosts /etc/hosts.backup.$(date +%F)
sudo chattr +i /etc/hosts
# To Unlock
#sudo chattr -i /etc/hosts
