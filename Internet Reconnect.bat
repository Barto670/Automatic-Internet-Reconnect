@echo off
title Wifi Connect
goto :pingtest

:pingtest
ping -n 4 www.google.com | find "TTL"
if not errorlevel 1 goto :success
if errorlevel 1 goto :fail

:fail
netsh wlan connect ssid="Wifi1" name="Wifi1"
echo Opt1

:success
echo Connected
pause
goto pingtest2
:pingtest2
ping -n 4 www.google.com | find "TTL"
if not errorlevel 1 goto :success2
if errorlevel 1 goto :fail2
:success2
echo You have passed the test!
pause
:fail2
echo Sorry, you have failed the test. 