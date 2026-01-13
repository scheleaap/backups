#!/bin/sh

dump_directory="${1:-/var/backups/custom-dumps}"

mkdir -p "${dump_directory}"

apt list --installed > "${dump_directory}/apt-list-installed.txt"
apt-mark showmanual > "${dump_directory}/apt-mark-showmanual.txt"
