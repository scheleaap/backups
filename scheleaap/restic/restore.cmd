@echo off
cls
echo Restoring
setlocal
call config.cmd

DIT WERKT NOG NIET

:: set restoreto=restore-%date:~-4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%
:: mkdir %restoreto%

:: restic -r b2:%B2_BUCKET%:scheleaap/d --verbose restore --target %restoreto% "latest"
:: restic -r b2:%B2_BUCKET%:aapserver --verbose restore --target %restoreto% "latest"

restic -r b2:%B2_BUCKET%:aapserver ls latest
