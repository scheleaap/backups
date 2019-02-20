#!/bin/sh
echo "Backing up"
source /etc/duplicacy/config
(cd / && duplicacy -log backup -threads 8 -stats)
