# Simons-Bluetooth-Audio-Fixing-Script
unpairs and repairs a specified bluetooth device, then walks the user through reconfiguring Equalizer APO to work on the new device, without restarting the computer!

requires Bluetooth Command Line Tools, must also be added to PATH (it will add itself to PATH by default in the installer)

  https://bluetoothinstaller.com/bluetooth-command-line-tools


Where, when, why is this useful to anybody?

If you must know, ...

I bought this bluetooth audio receiver off Amazon and it works great for making wired headphones wireless. The only issue is that the bluetooth drivers suck. My computer is unable to disconnect from the device, and then it's unable to connect because it thinks it's already connected. Turning bluetooth off and on again fixes the problem about one out every 25 times. I have to remove the device and re-pair. The only problem with this is that I use Equalizer APO, and to get that working with a new device, you have to restart the computer. Or at least the windows audio service. This script automates the process as much as I could, and saves a bit of time considering that I have to do all this every time I close and repoen my laptop.
