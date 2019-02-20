#!/bin/bash
echo Initializing repositories
source /opt/backups/server/linux-duplicacy/config
(cd / && duplicacy init -encrypt -pref-dir /opt/backups/server/linux-duplicacy/.duplicacy-$DUPLICACY_REPOSITORY_ID -repository / $DUPLICACY_REPOSITORY_ID b2://$DUPLICACY_B2_BUCKET)
