#!/bin/bash

SOURCE_DIR="$HOME/backup-script/sample-data"
BACKUP_DIR="$HOME/backup-script/backups"

DATE=$(date +%Y-%m-%d_%H-%M-%S)

BACKUP_NAME="backup_$DATE.tar.gz"

RETENTION_DAYS=7

echo "Starting backup..."

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

if [ $? -eq 0 ]
then
    echo "Backup successful!"
    echo "Backup saved to: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Backup failed!"
    exit 1
fi

echo "Deleting backups older than $RETENTION_DAYS days..."

find "$BACKUP_DIR" -name "*.tar.gz" -type f -mtime +$RETENTION_DAYS -exec rm {} \;

echo "Backup process completed."
