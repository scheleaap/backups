@echo off
cls
echo Backing up
setlocal
call config.cmd
pushd d:\ & %DUPLICACY% -log backup -threads 8 -stats & popd
pushd c:\ & %DUPLICACY% -log backup -threads 4 -stats & popd
