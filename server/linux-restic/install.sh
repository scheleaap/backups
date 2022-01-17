#!/bin/sh

mkdir -p /opt/restic
curl -sL https://github.com/restic/restic/releases/download/v0.12.1/restic_0.12.1_linux_amd64.bz2 | bzip2 -d > /opt/restic/restic
chmod +x /opt/restic/restic
