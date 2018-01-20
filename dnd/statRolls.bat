@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

REM This script is designed to be used with the dnd 5e stat roll table
REM the actions the following script emulates are. Rolling 4d6 then
REM dropping the lowest. For peace of mind this script prints all
REM of the 'dice' rolls

REM Roll Loop
for /L %%i in (1,1,6) do (
	for /L %%j in (1,1,4) do (
		set /a rollVal=!RANDOM! %%6 +1
		set roll[%%i][%%j]=!rollVal!
		echo stat %%i roll %%j: !roll[%%i][%%j]!
	)
	echo.

	set /a total=0
	set /a lowest=!roll[%%i][1]!
	for /L %%j in (1,1,4) do (
		if !roll[%%i][%%j]! LSS !lowest! (
			set /a lowest=!roll[%%i][%%j]!
		)
	)
	for /L %%j in (1,1,4) do (
		if !roll[%%i][%%j]! GTR !lowest! (
			set /a total+=!roll[%%i][%%j]!
		)
		if !roll[%%i][%%j]! EQU !lowest! (
			set /a lowest-=!lowest!
		)
	)
	echo stat %%i total: !total!
	echo.
)