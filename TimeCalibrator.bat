@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
@echo off 
����if "%1" == "h" goto begin 
����mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
����:begin
mshta vbscript:CreateObject("Wscript.Shell").popup("����У׼������ʱ��...У׼ǰ%time%",5,"����",64)(window.close)
ping -n 30 127.0.0.1 > nul
w32tm /resync
mshta vbscript:CreateObject("Wscript.Shell").popup("�ɹ���У׼��%time%",5,"����",64)(window.close)