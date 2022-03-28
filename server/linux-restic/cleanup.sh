#!/bin/bash
echo "Cleaning up"
basedir=/opt/backups/server/linux-restic
source $basedir/config
/opt/restic/restic -r b2:${B2_BUCKET}:aapserver --verbose forget --keep-last 1 --keep-daily 7 --keep-weekly 4 --keep-monthly 12
