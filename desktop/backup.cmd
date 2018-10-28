@echo off
cls
echo Backing up
setlocal
call config.cmd
pushd c: & %DUPLICACY% -log backup -dry-run -stats & popd
pushd d: & %DUPLICACY% -log backup -dry-run -stats & popd
