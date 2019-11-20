@echo off
echo Type number of folders to make, then press enter:
SET /P nmbrfldrs=
echo Name folders randomly? (y/n)
SET /P israndom=
SET f=1

If %israndom%==y goto echoffr
If %israndom%==n goto echoffn

:echoffn
@echo off
:normal
md %f%
SET /a f+=1
If %f% LEQ %nmbrfldrs% goto normal
exit

:echoffr
@echo off
If %nmbrfldrs% GTR 32767 echo The number of folders allowed to be created using random naming has been exceeded. It will now be changed to 32767 to accommodate the limitations of this program.
If %nmbrfldrs% GTR 32767 SET nmbrflds=32767
@echo off
pause
echo Press any key to start. Please note that because folders are named randomly, the number chosen for any given folder name may already be in use. This program will keep trying to make new folders with random naming until it uses every number up to 32767. This will take an unknown amount of time. To cancel now, press "c".
SET /P cncl=
If %cncl%=c exit

@echo off
:rndm
md %RANDOM%
SET /a f+=1
If %f% LEQ %nmbrfldrs% goto rndm
exit