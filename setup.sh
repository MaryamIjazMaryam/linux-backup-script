#!/bin/bash
# Project setup commands for the Linux Backup Script

# 1. Create the project folders
mkdir -p ~/backup-script/backups
mkdir -p ~/backup-script/sample-data

# 2. Create sample files to back up
echo "This is a test file." > ~/backup-script/sample-data/testfile.txt
echo "This is another file for backup testing." > ~/backup-script/sample-data/file2.txt

# 3. Check the structure
ls -R ~/backup-script

# 4. Make the backup script executable (after saving backup.sh in ~/backup-script)
cd ~/backup-script
chmod +x backup.sh

# 5. Run the first backup
./backup.sh

# 6. Verify the backups
ls -lh backups/

# 7. Schedule daily backup at 2:00 AM (run `crontab -e`, then add this line):
# 0 2 * * * /home/YOUR_USERNAME/backup-script/backup.sh

# 8. Confirm the cron job
crontab -l
