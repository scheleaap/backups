#!/bin/sh

sudo apt-get install restic

sudo mkdir -p /usr/local/lib/systemd/system
sudo ln -s /home/wout/dev/backups/scheleaapub/restic/backup.service /usr/local/lib/systemd/system/backup.service
sudo ln -s /home/wout/dev/backups/scheleaapub/restic/backup.timer /usr/local/lib/systemd/system/backup.timer
sudo systemctl enable backup.timer
