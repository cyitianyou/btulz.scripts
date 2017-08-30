@echo off
setlocal EnableDelayedExpansion
echo *************************************************************************************
echo             copy_wars.bat
echo                  by niuren.zhu
echo                          2017.08.30
echo  ˵����
echo     1. ��������Ŀ¼��Ѱ��war����./ibas_packages��
echo     2. ����1������Ŀ¼��
echo **************************************************************************************
REM ���ò�������
SET STARTUP_FOLDER=%~dp0
SET PACKAGES_FOLDER=%STARTUP_FOLDER%ibas_packages\
SET WORK_FOLDER=%1

if "%WORK_FOLDER:~-1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\
if not exist "%PACKAGES_FOLDER%" mkdir "%PACKAGES_FOLDER%"

REM ��ʾ������Ϣ
echo ----------------------------------------------------
echo --������Ŀ¼��%WORK_FOLDER%
echo --�����Ŀ¼��%PACKAGES_FOLDER%
echo ----------------------------------------------------

if not exist "%WORK_FOLDER%compile_order.txt" dir /a:d /b "%WORK_FOLDER%" >"%WORK_FOLDER%compile_order.txt"

for /f %%l in (%WORK_FOLDER%compile_order.txt) do (
  SET FOLDER=%WORK_FOLDER%%%l\release\
  if exist "!FOLDER!*.war" (  
    copy /y "!FOLDER!*.war" "%PACKAGES_FOLDER%"
  )
)
echo --�����嵥��
dir "%PACKAGES_FOLDER%"\*.war
echo �������