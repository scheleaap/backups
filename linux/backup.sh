#!/bin/bash

set -o nounset
set -o errexit

prog=$(basename $0)
#user=$(id -n -u)
#hostname=$(hostname)

if [ "$#" -ne 2 ]; then
    >&2 echo "Error: Incorrect number of parameters"
    >&2 echo
    #>&2 echo "Usage: $0 DEST_USER@DEST_HOST DEST_PATH GLOBINCLUDE_FILE GLOBEXCLUDE_FILE"
    >&2 echo "Usage: $0 GLOBINCLUDE_FILE GLOBEXCLUDE_FILE"
    >&2 echo "Example: globinclude.list globexclude.list"
    exit 1
fi

globinclude_file=${1:-globinclude.list}
globexclude_file=${2:-globexclude.list}

lock=/var/lock/${prog}.pid
backup_source="/"
#backup_target="${dest_userhost}::${dest_path}"
backup_target="/var/backup/data"
binary=$(which rdiff-backup)

if [ "${binary}" == "" ]; then
    >&2 echo "Error: rdiff-backup not found"
    exit 1
fi

echo "Lock file: $lock"
echo "Binary: $binary"
echo "Backup source: ${backup_source}"
echo "Backup target: ${backup_target}"

if [ -e $lock ]
then
        pid=$(cat $lock)
        if kill -CHLD $pid
        then
                echo "Process already running"
                exit 0
        else
                echo "Stale proccess ($pid) detected, continue"
        fi
#else
#       echo "geen lock, dus backuppen maar"
fi

echo $$ > $lock

verbosity=3
#print_statistics="--print-statistics"
print_statistics=""
cmd="$binary -v${verbosity} ${print_statistics} --exclude-special-files --include-globbing-filelist ${globinclude_file} --exclude-globbing-filelist ${globexclude_file} ${backup_source} ${backup_target}"

echo "Starting backup"

#echo $cmd
$cmd

#$binary -v2 --force --remove-older-than 4W margo@$dest_host::$dest_path

/bin/rm -f $lock

echo "Backup finished"
