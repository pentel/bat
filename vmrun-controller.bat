@ECHO off

REM 
REM vmware player doesn't support pause and unpause
REM 

REM title
TITLE vmrun controller

REM show power commands
ECHO [1] power on
ECHO [2] power off
ECHO [3] reboot
ECHO [4] suspend
ECHO [5] pause
ECHO [6] unpause

REM path to vmx file
SET VMXPATH="C:\path\to\xxx.vmx"

REM path to vmrun.exe
SET PROGRAM="C:\path\to\vmrun.exe"

SET /p I="select vmrun command [] >"
SET OPTION=

IF "%I%" == "" (
  ECHO BLANK!!
  PAUSE
  EXIT
)

GOTO CASE_%I%
:CASE_1
  SET COMMAND=start
  SET OPTION=nogui
  GOTO END_SWITCH
:CASE_2
  SET COMMAND=stop
  SET OPTION=soft
  GOTO END_SWITCH
:CASE_3
  SET COMMAND=reset
  SET OPTION=soft
  GOTO END_SWITCH
:CASE_4
  SET COMMAND=suspend
  SET OPTION=soft
  GOTO END_SWITCH
:CASE_5
  SET COMMAND=pause
  GOTO END_SWITCH
:CASE_6
  SET COMMAND=unpause
  GOTO END_SWITCH
:END_SWITCH

REM run the vmrun
%PROGRAM% -T player %COMMAND% %VMXPATH% %OPTION%
IF NOT ERRORLEVEL 0 pause

EXIT
