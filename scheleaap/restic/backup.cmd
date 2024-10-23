@echo off
cls
echo Backing up
setlocal
call config.cmd
restic -r b2:%B2_BUCKET%:scheleaap/d --verbose backup --files-from d-includes.txt --exclude-file d-excludes.txt
