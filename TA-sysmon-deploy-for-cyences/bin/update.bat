ECHO OFF

SET SPLUNKPATH=%~dp0

>> C:\Windows\sysmon.log (
fc C:\Windows\sysmonconfig.xml "%SPLUNKPATH%\sysmonconfig.xml" | Find "no differences" 1>nul && echo %DATE%-%TIME% No updates found && exit
echo %DATE%-%TIME% Update found, installing && copy /z /y "%SPLUNKPATH%\sysmonconfig.xml" "C:\Windows\" && "C:\Windows\Sysmon.exe" -c C:\Windows\sysmonconfig.xml
)
