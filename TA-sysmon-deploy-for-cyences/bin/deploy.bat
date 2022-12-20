ECHO OFF

SET SPLUNKPATH=%~dp0

ECHO %DATE%-%TIME% The TA Bin PATH %SPLUNKPATH% >> %WINDIR%\sysmon.log
ECHO %DATE%-%TIME% Checking for Sysmon >> %WINDIR%\sysmon.log

FOR /F "delims=" %%c IN ('sc query "Sysmon" ^| FIND /c "RUNNING"') DO (
    SET CHECK_SYSMON_RUNNING=%%c
)
ECHO %DATE%-%TIME% CHECK_SYSMON_RUNNING="%CHECK_SYSMON_RUNNING%" >> %WINDIR%\sysmon.log

FOR /F "delims=" %%b IN ('C:\Windows\Sysmon.exe ^| FIND /c "System Monitor v14.13"') DO (
    SET CHECK_SYSMON_VERSION=%%b
)

FOR /F "delims=" %%z IN ('C:\Windows\Sysmon.exe ^| FIND /i "System"') DO (
    SET SYSMON_VERSION=%%z
)

if "%CHECK_SYSMON_RUNNING%" == "1" (
    ECHO %DATE%-%TIME% Sysmon found, checking version >> %WINDIR%\sysmon.log
	ECHO %DATE%-%TIME% CHECK_SYSMON_VERSION="%CHECK_SYSMON_VERSION%" >> %WINDIR%\sysmon.log
	ECHO %DATE%-%TIME% sysmon_version="%SYSMON_VERSION%" >> %WINDIR%\sysmon.log
    IF "%CHECK_SYSMON_VERSION%" == "1" (
        ECHO %DATE%-%TIME% Sysmon already up to date, exiting >> %WINDIR%\sysmon.log
        EXIT
    ) ELSE (
        ECHO %DATE%-%TIME% Sysmon binary is outdated, un-installing >> %WINDIR%\sysmon.log
        IF EXIST C:\Windows\Sysmon.exe (
            C:\Windows\Sysmon.exe -u
			ECHO %DATE%-%TIME% Installing Sysmon >> %WINDIR%\sysmon.log
			"%SPLUNKPATH%\Sysmon.exe" /accepteula -i C:\Windows\sysmonconfig.xml | Find /c "Sysmon installed" 1>NUL
			ECHO %DATE%-%TIME% Install complete! >> %WINDIR%\sysmon.log
			EXIT
        )
    )
) ELSE (
    ECHO %DATE%-%TIME% Sysmon not found, proceding to install >> %WINDIR%\sysmon.log
    ECHO %DATE%-%TIME% Copying the latest config file >> %WINDIR%\sysmon.log
    COPY /z /y "%SPLUNKPATH%\sysmonconfig.xml" "C:\Windows\"
    ECHO %DATE%-%TIME% Installing Sysmon >> %WINDIR%\sysmon.log
    "%SPLUNKPATH%\Sysmon.exe" /accepteula -i C:\Windows\sysmonconfig.xml | Find /c "Sysmon installed" 1>NUL
    ECHO %DATE%-%TIME% Install complete! >> %WINDIR%\sysmon.log
    EXIT
)
ECHO %DATE%-%TIME% Install failed >> %WINDIR%\sysmon.log

