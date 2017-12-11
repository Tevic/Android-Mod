@ECHO OFF
SETLOCAL EnableDelayedExpansion
COLOR 3F
SET PATH=..\SDKPlatformTools;%PATH%

CD .\IMG
SET  INDEX=1
FOR /F "DELIMS=" %%F IN ('DIR /A /B *.IMG') DO (
ECHO !INDEX!.%%F
SET REC!INDEX!=%%F
SET /A INDEX+=1
)
CD ..

SET /P NO="Choose Rec:"
SET REC=!REC%NO%!
TITLE %REC%
ECHO You Choose:%REC%
PAUSE
CLS

ECHO =================================================
ECHO Start Flashing...
XCopy ".\IMG\%REC%" ".\recovery.img" /e /i /y

pause
ECHO Device:
fastboot.exe devices

pause
ECHO Flashing...
fastboot.exe flash recovery recovery.img
ECHO Boot To Recovery...
fastboot.exe boot recovery.img
ECHO Flash Successfully!
ECHO =================================================

PAUSE
