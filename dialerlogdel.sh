#!/bin/bash
# This script deletes the dialerd log file in Issabel, sends email after log deletion, and reboots the server.

# Navigate to the directory
cd /opt/issabel/dialer

# Delete the dialer-d log file
rm -rf dialerd.log-*

# Check if the deletion was successful
if [ $? -eq 0 ]; then
    echo "Log files successfully deleted." | mailx -s "Log deletion confirmation" pbxsysadmin@gmail.com
else
    echo "Failed to delete log files." | mailx -s "Log deletion failure" pbxsysadmin@gmail.com
fi

# List files to verify deletion
ls -lh

# Empty the primary log file
echo " " > dialerd.log

echo "Log files cleaned up."

# Safety delay before reboot
echo "System will reboot in 10 seconds..."
sleep 10

# Reboot the server
echo "Rebooting now..."
sudo shutdown -r now
