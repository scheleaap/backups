#!/bin/bash
echo "Initializing repositories"
source /opt/backups/server/linux-restic/config
restic -r b2:${B2_BUCKET}:aapserver init
