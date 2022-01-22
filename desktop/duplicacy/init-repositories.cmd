@echo off
cls
echo Initializing repositories
setlocal
call config.cmd
%DUPLICACY% init -encrypt -pref-dir d:/progs/scripts/backups/backups/desktop/.duplicacy-c -repository c:/ desktop-c b2://%B2_BUCKET_PREFIX%-c
%DUPLICACY% init -encrypt -pref-dir d:/progs/scripts/backups/backups/desktop/.duplicacy-d -repository d:/ desktop-d b2://%B2_BUCKET_PREFIX%-d
