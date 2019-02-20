#!/bin/sh
echo Initializing repositories
source /etc/duplicacy/config
duplicacy init -encrypt -pref-dir /opt/backups/server/linux-duplicacy/.duplicacy-$DUPLICACY_REPOSITORY_ID -repository / $DUPLICACY_REPOSITORY_ID b2://$DUPLICACY_B2_BUCKET
