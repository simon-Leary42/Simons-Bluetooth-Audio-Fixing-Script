@echo off
:: Change these variables to suit your needs
set DEVICE_NAME="DEFAULT"
set EQAPO_FOLDER="C:\Program Files\EqualizerAPO\"
echo Simon's bluetooth audio device fixing script
echo be sure to run me as administrator! You can create a shortcut and change the shortcut properties to run as admin.
echo make sure to install Bluetooth Command Line Tools! https://bluetoothinstaller.com/bluetooth-command-line-tools
echo unpairing device... If the device isn't already paired then just wait 30 seconds
if %DEVICE_NAME% == "DEFAULT" (
    echo You need to open this file and input your device name for this to work!
    pause
    exit
)
btpair -u -n %DEVICE_NAME%
echo tell your device to start pairing and then press a key
pause
echo windows will give you a popup in the bottom right asking to set up your device, do it
echo windows should ask you to allow the connection. If it cuts short to 'connection successful', then it didn't work.
echo You might have to turn off bluetooth and turn it back on. Don't know why this happens sometimes.
btpair -p -n %DEVICE_NAME%

SET choice=
SET /p choice=Do you use Equalizer APO? [Y / Enter]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO.
GOTO start

:no
    exit

:yes
    echo when configurator opens, check the box for your device, then when it asks to reboot, don't.
    timeout /t 2
    cd %EQAPO_FOLDER%
    configurator.exe
    echo restarting windows audio service, if it asks 'Y/N' say 'Y'
    net stop audiosrv
    net start audiosrv
    echo "

    SET choice=
    SET /p choice=Do you have any device specific options set in EqAPO? The device is different now, you will need to reselect it in the editor. [Y / Enter]: 
    IF NOT '%choice%'=='' SET choice=%choice:~0,1%
    IF '%choice%'=='Y' GOTO yes
    IF '%choice%'=='y' GOTO yes
    IF '%choice%'=='N' GOTO no
    IF '%choice%'=='n' GOTO no
    IF '%choice%'=='' GOTO no
    ECHO "%choice%" is not valid
    ECHO.
    GOTO start

    :no
        exit

    :yes
        editor.exe
        echo my work here is done.
        pause
        exit