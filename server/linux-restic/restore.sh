#!/bin/bash
echo "Restoring"
source ./config

restoreto=restore-$(date '+%Y%m%d-%H%M%S')
mkdir $restoreto

/opt/restic/restic -r b2:${B2_BUCKET}:aapserver --verbose restore --target ${restoreto} "latest" --include /etc
