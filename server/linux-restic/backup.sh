#!/bin/bash
echo "Backing up"
source /opt/backups/server/linux-restic/config
restic -r b2:${B2_BUCKET}:aapserver --verbose backup --files-from includes.txt --exclude-file excludes.txt
