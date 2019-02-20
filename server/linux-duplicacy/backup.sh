#!/bin/bash
echo "Backing up"
source /opt/backups/server/linux-duplicacy/config
(cd / && duplicacy -log backup -threads 8 -stats)
