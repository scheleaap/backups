@echo off
::cls
echo Synchronizing the backup

:: Make environment variable changes local to this batch file
setlocal

call config.cmd

SET CWRSYNCHOME=%~dp0
IF NOT EXIST %CWRSYNCHOME%\home\%USERNAME%\.ssh MKDIR %CWRSYNCHOME%\home\%USERNAME%\.ssh
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\bin;%PATH%

rsync -h -v --archive --compress --progress %remote_user%@%remote_host%:%remote_path% %target_dir%
:: --dry-run
:: --rsh='ssh -i backups-20160820'
