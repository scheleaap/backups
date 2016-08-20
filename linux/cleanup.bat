@echo off
::cls
echo Dit is het opruimscript voor backups.

exit

::"C:\Program Files\Systeem\rdiff-backup\rdiff-backup" -v3 --remote-schema """C:\Program Files\Internet\PuTTY\plink.exe"" -i D:\Software\Keys\backups.ppk %%s rdiff-backup --server" --force --remove-older-than 4W root@localhost::/backups/windowspc/c/
:: >> cleanup.log 2>&1
::"C:\Program Files\Systeem\rdiff-backup\rdiff-backup" -v3 --remote-schema """C:\Program Files\Internet\PuTTY\plink.exe"" -i D:\Software\Keys\backups.ppk %%s rdiff-backup --server" --force --remove-older-than 4W root@localhost::/backups/windowspc/d/
:: >> cleanup.log 2>&1
::"C:\Program Files\Systeem\rdiff-backup\rdiff-backup" -v3 --remote-schema """C:\Program Files\Internet\PuTTY\plink.exe"" -i D:\Software\Keys\backups.ppk %%s rdiff-backup --server" --force --remove-older-than 4W root@localhost::/backups/windowspc/e/
:: >> cleanup.log 2>&1
::"C:\Program Files\Systeem\rdiff-backup\rdiff-backup" -v3 --remote-schema """C:\Program Files\Internet\PuTTY\plink.exe"" -i D:\Software\Keys\backups.ppk %%s rdiff-backup --server" --force --remove-older-than 4W root@localhost::/backups/windowspc/h/
:: >> cleanup.log 2>&1
::"C:\Program Files (x86)\rdiff-backup\rdiff-backup" -v3 --remote-schema """C:\Program Files\PuTTY\plink.exe"" -i D:\Users\Wout\Software\Keys\backups.ppk %%s rdiff-backup --server" --force --remove-older-than 4W I:\A-b
:: >> cleanup.log 2>&1
