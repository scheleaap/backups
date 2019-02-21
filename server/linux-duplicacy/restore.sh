#!/bin/bash
echo Restoring
source config

repository_name=$DUPLICACY_REPOSITORY_ID
revision=3
restore_from=b2://$DUPLICACY_B2_BUCKET
restoreto=restore-$(date '+%Y%m%d-%H%M%S')
mkdir $restoreto

(cd $restoreto && \
  duplicacy init -encrypt $repository_name $restore_from && \
  duplicacy -log list -all && \
  duplicacy -log restore -r $revision -threads 10 -stats \
)
