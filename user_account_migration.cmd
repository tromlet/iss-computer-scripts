for /f "delims== tokens=2" %%g in ('findstr /C:"LOGPATH" "%configpath%"') do (set ADMINUSER=%%g)

set LOGPATH=

robocopy "%userprofile%\Desktop" /log:%logpath%