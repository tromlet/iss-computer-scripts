REM VARIABLES
REM Setting variables in this section

REM This sets the path to the config file that this file takes a lot of 
REM instructions from check out the 'config-gen.cmd' script to easily generate
REM your preferences.
echo Type the full path to your 'config.ini' file (example: 
echo 'C:\Users\User\Desktop\iss-scripts\config.ini').
set /P CONFIGPATH=Config File Path: 

REM These set some of the needed variables in this script to some of the values
REM you set in your config file.
for /f "delims== tokens=2" %%g in ('findstr /C:"ADMINUSERNAME" "%configpath%"') do (set ADMINUSER=%%g)
for /f "delims== tokens=2" %%g in ('findstr /C:"ADMINPASSWORD" "%configpath%"') do (set ADMINUSER=%%g)

REM Adds the INSS-Admin local administrator to the computer
net user %adminuser% %adminpw% /add

REM Adds the INSS-Admin user to the local administrators group
net localgroup "Administrators" %adminuser% /add

REM Removes password expiration from the INSS-Admin user
wmic UserAccount where Name="%adminuser%" set PasswordExpires=false