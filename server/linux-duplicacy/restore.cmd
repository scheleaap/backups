@echo off
cls
echo Restoring
setlocal
call config.cmd

set repository_name=desktop-d
set revision=40
set restore_from=b2://%B2_BUCKET_PREFIX%-d

set restoreto=restore-%date:~-4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%%time:~6,2%
mkdir %restoreto%

pushd %restoreto% & ^
%DUPLICACY% init -encrypt %repository_name% %restore_from% & ^
%DUPLICACY% -log list -all & ^
%DUPLICACY% -log restore -r %revision% -threads 10 -stats & ^
popd
