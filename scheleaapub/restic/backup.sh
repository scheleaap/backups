#!/bin/bash

set -e

echo "Backing up"

basedir=~/dev/backups/scheleaapub/restic
source $basedir/config

restic backup \
  --files-from $basedir/includes.txt \
  --exclude-file $basedir/excludes.txt
