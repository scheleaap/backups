#!/bin/bash

set -e

echo "Restoring"

basedir=~/dev/backups/scheleaapub/restic
source $basedir/config

restoreto=restore-$(date '+%Y%m%d-%H%M%S')
mkdir $restoreto

restic restore \
  --verbose \
  --target ${restoreto} "latest" \
  --include /etc
