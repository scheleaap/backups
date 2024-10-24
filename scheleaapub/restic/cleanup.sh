#!/bin/bash

set -e

echo "Cleaning up"

basedir=~/dev/backups/scheleaapub/restic
source $basedir/config

restic forget \
  --verbose \
  --prune \
  --keep-last 1 --keep-daily 7 --keep-weekly 4 --keep-monthly 12

restic check \
  --verbose
