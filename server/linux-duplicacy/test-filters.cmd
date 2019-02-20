@echo off
cls
setlocal
call config.cmd
pushd d:\ & %DUPLICACY% -d -log backup -enum-only & popd
pushd c:\ & %DUPLICACY% -d -log backup -enum-only & popd
