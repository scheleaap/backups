#!/bin/bash

set -e

echo "Initializing repositories"

basedir=~/dev/backups/scheleaapub/restic
source $basedir/config

restic init
