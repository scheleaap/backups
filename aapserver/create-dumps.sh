#!/bin/sh

dump_directory="${1:-/var/backups/custom-dumps}"

mkdir -p "${dump_directory}"

#apt list --installed > "${dump_directory}/apt-list-installed.txt"
dpkg-query -W -f '${binary:Package}\t${Version}\t${Status}\n' | awk -F'\t' '$3 == "install ok installed"' > "${dump_directory}/dpkg-installed.txt"
apt-mark showmanual > "${dump_directory}/apt-mark-showmanual.txt"
