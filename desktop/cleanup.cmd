@echo off
cls
echo Cleaning up
setlocal
call config.cmd
pushd d:\ & %DUPLICACY% -log prune -keep 0:360 -keep 30:180 -keep 7:30 -keep 1:7 & popd
pushd c:\ & %DUPLICACY% -log prune -keep 0:360 -keep 30:180 -keep 7:30 -keep 1:7 & popd
:: pushd d:\ & %DUPLICACY% -log prune -keep 0:15 -keep 1:7 --dry-run & popd
:: pushd c:\ & %DUPLICACY% -log prune -keep 0:15 -keep 1:7 --dry-run & popd
