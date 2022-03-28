#!/bin/bash
echo "Backing up"
basedir=/opt/backups/server/linux-restic
source $basedir/config
/opt/restic/restic -r b2:${B2_BUCKET}:aapserver backup --files-from $basedir/includes.txt --exclude-file $basedir/excludes.txt
