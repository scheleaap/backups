@echo off
cls
echo Cleaning up
setlocal
call config.cmd

restic -r b2:%B2_BUCKET%:scheleaap/d --verbose forget --prune --keep-last 1 --keep-daily 7 --keep-weekly 4 --keep-monthly 12
restic -r b2:%B2_BUCKET%:scheleaap/d --verbose check
