#!/bin/bash
echo "Initializing repositories"
source /opt/backups/aapserver/restic/config
/opt/restic/restic -r b2:${B2_BUCKET}:aapserver init
