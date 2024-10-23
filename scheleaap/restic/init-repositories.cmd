@echo off
cls
echo Initializing repositories
setlocal
call config.cmd
:: restic -r b2:%B2_BUCKET%:scheleaap/c init
restic -r b2:%B2_BUCKET%:scheleaap/d init
