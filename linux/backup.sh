#! /bin/bash

set -o nounset
set -o errexit

prog=$(basename $0)

if [ "$#" -ne 4 ]; then
    >&2 echo "Incorrect number of parameters"
    >&2 echo "Usage: $0 DEST_USER@DEST_HOST DEST_PATH GLOBINCLUDE_FILE GLOBEXCLUDE_FILE"
    >&2 echo "Example: $0 me@example.com /var/backup globinclude.lst globexclude.lst"
fi

lock=/var/lock/${prog}.pid
dest_userhost=${1:-$(id -n -u)@localhost}
dest_path=${2:-/var/backups/data}
globinclude_file=${3:-globinclude.lst}
globexclude_file=${4:-globexclude.lst}
binary=$(which rdiff-backup)

if [ "${binary}" == "" ]; then
    >&2 echo "Error: rdiff-backup not found"
    exit 1
fi

echo "Lock file: $lock"
echo "Backup destination: ${dest_path} on ${dest_userhost}"
echo "Binary: $binary"

if [ -e $lock ]
then
        pid=$(cat $lock)
        if kill -CHLD $pid
        then
                echo 2>&1 "$prog: Process already running"
                exit 0
        else
                echo 2>&1 "$prog: Stale proccess ($pid) detected, continue"
        fi
#else
#       echo "$prog: geen lock, dus backuppen maar"
fi

echo $$ > $lock

verbosity=3
#print_statistics="--print-statistics"
print_statistics=""
cmd="$binary -v{$verbosity} ${print_statistics} --exclude-special-files --include-globbing-filelist ${globinclude_file} --exclude-globbing-filelist ${globexclude_file} / ${dest_userhost}::${dest_path}"
#echo $cmd

echo "$prog: Starting backup"

$cmd

#$binary -v2 --force --remove-older-than 4W margo@$dest_host::$dest_path

/bin/rm -f $lock

echo "$prog: Backup finished"
