REM Dahua Checker User setup script
set CONFIGFILE=config.ini

REM Create users
for /f "delims== tokens=1-3" %%g in (%configfile%) do (
  if %%g EQU "User" (
    set DHUSER=%%g && set DHPASS=%%h
    net user "%dhuser%" "%dhpass%" /add
    wmic useraccount where name="%dhuser%" set passwordexpires=false
  )

  
)