@echo off
echo Clearing network cache...

:: Flush DNS cache
ipconfig /flushdns
echo DNS cache cleared.

:: Release IP address
ipconfig /release
echo IP address released.

:: Renew IP address
ipconfig /renew
echo IP address renewed.

:: Reset Winsock
netsh winsock reset
echo Winsock reset.

:: Reset TCP/IP stack
netsh int ip reset
echo TCP/IP stack reset.
