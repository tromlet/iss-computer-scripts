@echo off

call :date

call :time

call :descriptive-date

call :descriptive-time

call :date-time

echo YYYY:    %yyyy%
echo MM:      %mm%
echo DD:      %dd%
echo HOURS:   %hours%
echo MINUTES: %minutes%
echo SECONDS: %seconds%
echo.
echo DATE-TIME(yyyymmdd_hoursminutesseconds): %date-time%
echo DATE2: %date2%
echo TIME2: %time2%
echo.
echo MONTH:      %month%
echo DAYOFWEEK:  %dayofweek%
echo DAYOFMONTH: %dayofmonth%
echo DESC-DATE:  %desc-date%
echo DESC-TIME:  %desc-time%
echo HR:   %hr%
echo NOON: %noon%
echo.

goto :eof


:date-time

call :date

call :time

set DATE-TIME=%date2%_%time2%

exit /b


:descriptive-date

call :date

FOR /f "tokens=2 delims==." %%g IN ('wmic path win32_localtime get dayofweek /FORMAT:list') DO (set DOW=%%g)

IF %dow% EQU 1 set DAYOFWEEK=Monday
IF %dow% EQU 2 set DAYOFWEEK=Tuesday
IF %dow% EQU 3 set DAYOFWEEK=Wednesday
IF %dow% EQU 4 set DAYOFWEEK=Thursday
IF %dow% EQU 5 set DAYOFWEEK=Friday
IF %dow% EQU 6 set DAYOFWEEK=Saturday
IF %dow% EQU 7 set DAYOFWEEK=Sunday

IF %mm% EQU 01 set MONTH=January
IF %mm% EQU 02 set MONTH=February
IF %mm% EQU 03 set MONTH=March
IF %mm% EQU 04 set MONTH=April
IF %mm% EQU 05 set MONTH=May
IF %mm% EQU 06 set MONTH=June
IF %mm% EQU 07 set MONTH=July
IF %mm% EQU 08 set MONTH=August
IF %mm% EQU 09 set MONTH=September
IF %mm% EQU 10 set MONTH=October
IF %mm% EQU 11 set MONTH=November
IF %mm% EQU 12 set MONTH=December

IF %dd% LSS 10 (
  IF %dd:~-1% EQU 1 set SUFFIX=st
  IF %dd:~-1% EQU 2 set SUFFIX=nd
  IF %dd:~-1% EQU 3 (
    set SUFFIX=rd
  ) ELSE (
    set SUFFIX=th
  )
) ELSE (
  IF %dd% GTR 20 (
    IF %dd:~-1% EQU 1 set SUFFIX=st
    IF %dd:~-1% EQU 2 set SUFFIX=nd
    IF %dd:~-1% EQU 3 (
      set SUFFIX=rd
    ) ELSE (
      set SUFFIX=th
    )
  )
)

set DAYOFMONTH=%dd%%suffix%

REM IF %dd% EQU 1 set DAYOFMONTH=1st
REM IF %dd% EQU 2 set DAYOFMONTH=2nd
REM IF %dd% EQU 3 set DAYOFMONTH=3rd
REM IF %dd% EQU 4 set DAYOFMONTH=4th
REM IF %dd% EQU 5 set DAYOFMONTH=5th
REM IF %dd% EQU 6 set DAYOFMONTH=6th
REM IF %dd% EQU 7 set DAYOFMONTH=7th
REM IF %dd% EQU 8 set DAYOFMONTH=8th
REM IF %dd% EQU 9 set DAYOFMONTH=9th
REM IF %dd% EQU 10 set DAYOFMONTH=10th
REM IF %dd% EQU 11 set DAYOFMONTH=11th
REM IF %dd% EQU 12 set DAYOFMONTH=12th
REM IF %dd% EQU 13 set DAYOFMONTH=13th
REM IF %dd% EQU 14 set DAYOFMONTH=14th
REM IF %dd% EQU 15 set DAYOFMONTH=15th
REM IF %dd% EQU 16 set DAYOFMONTH=16th
REM IF %dd% EQU 17 set DAYOFMONTH=17th
REM IF %dd% EQU 18 set DAYOFMONTH=18th
REM IF %dd% EQU 19 set DAYOFMONTH=19th
REM IF %dd% EQU 20 set DAYOFMONTH=20th
REM IF %dd% EQU 21 set DAYOFMONTH=21st
REM IF %dd% EQU 22 set DAYOFMONTH=22nd
REM IF %dd% EQU 23 set DAYOFMONTH=23rd
REM IF %dd% EQU 24 set DAYOFMONTH=24th
REM IF %dd% EQU 25 set DAYOFMONTH=25th
REM IF %dd% EQU 26 set DAYOFMONTH=26th
REM IF %dd% EQU 27 set DAYOFMONTH=27th
REM IF %dd% EQU 28 set DAYOFMONTH=28th
REM IF %dd% EQU 29 set DAYOFMONTH=29th
REM IF %dd% EQU 30 set DAYOFMONTH=30th
REM IF %dd% EQU 31 set DAYOFMONTH=31st

set DESC-DATE=%dayofweek%, %month% %dayofmonth% %yyyy%

exit /b


:descriptive-time

call :time

IF %hours% LSS 12 (
  IF %hours% LSS 10 (
    set HR=%hours:~1,1%
  ) ELSE (
    set HR=%hours%
  )
  set NOON=AM
)	ELSE (
		set /A HR=%hours% - 12
		set NOON=PM
)

set DESC-TIME=%hr%:%minutes% %noon%

exit /b


:date
FOR /f "tokens=2 delims==." %%g IN ('wmic os get localdatetime /FORMAT:list') DO (set LD=%%g)

set YYYY=%ld:~0,4%
set MM=%ld:~4,2%
set DD=%ld:~6,2%

set DATE2=%yyyy%%mm%%dd%

REM Old %date-time% code (for testing):
REM set DATE-TIME=%LDT:~0,8%_%LDT:~8,4%
REM set DATE2=%LDT:~0,8%
REM set TIME2=%LDT:~8,4%

exit /b


:time
FOR /f "tokens=2 delims==." %%g IN ('wmic os get localdatetime /FORMAT:list') DO (set LT=%%g)
set HOURS=%lt:~8,2%
set MINUTES=%lt:~10,2%
set SECONDS=%lt:~12,2%

set TIME2=%hours%%minutes%

exit /b