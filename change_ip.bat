@echo off
cd e:/change_ip/
echo %date% %time%: run script >>report.log
:BEGIN
TST10.exe /r:read_interface.telnet /o:out.txt
find out.txt "address: 8.8." >nul
if %ERRORLEVEL%==0 goto LIVE
TST10.exe /r:release_ip.telnet /o:out2.txt
timeout 10
echo %date% %time%: script find nat ip >> report.log
goto BEGIN
:LIVE
del out.txt
del out2.txt
echo %date% %time%: stop script >> report.log
Exit
