#!/bin/bash
echo "Cleaning up"
source /opt/backups/server/linux-duplicacy/config
(cd / && duplicacy -log prune -keep 0:360 -keep 180:180 -keep 30:30 -keep 7:7 -keep 1:1)
