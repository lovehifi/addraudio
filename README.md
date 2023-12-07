# Tips for using rAudio and LMS
### #1 Add NAS to rAudio
![Screenshot](001.jpg)
![Screenshot](002b.jpg)
![Screenshot](003.jpg)
>
----------------
#### How to add a music folder from your Windows 10 computer to rAudio?
> 
![Screenshot](add-nas-01.jpg)
>
![Screenshot](add-nas-02.jpg)
>
![Screenshot](add-nas-03.jpg)>
>
![Screenshot](add-nas-04.jpg)
>
**Use the newly created account to share music folders from your computer. For rAudio, also use that account Windows 10 to add the folders you shared from your computer into rAudio. Next, you can use LMS to access the NAS directory to listen to the music on your computer.**
>
--------
>
#### Listen to music from your NAS (or PC) with LMS on rAudio.
>
>
In LMS, click the Interface menu, scroll to Home screen items, click the Settings icon, click Disks and Folders.
>
![Screenshot](004.jpg)
>

![Screenshot](005.jpg)
>
-------
>
### #2 Install htop 64 bit
>
> cd /tmp && wget http://ftp.tku.edu.tw/Linux/ArchLinux-arm/aarch64/extra/htop-3.2.2-1-aarch64.pkg.tar.xz
>
> pacman -U htop-3.2.2-1-aarch64.pkg.tar.xz
>
-----------------
### #3 NFS IP in fstab
>
> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/mountnfs | sh
>
-----------------
### #4 Eqfa12 LMS 
>
>
> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/eqfa12lms | sh
>
![Screenshot](Eqfa12LMS.png)
>
https://github.com/lovehifi/eqfa12
>
-----------------
### #5 Config GUI LMS

> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/configgui | sh
>
Select the Audio I2S device if you are using an I2S DAC for the first time.
>
![Screenshot](choose-i2s.png)
>
Next, from the LMS - Config menu, you can easily switch between I2S DAC and USB DAC by dragging the circle. If you have multiple different USB DACs, you can also easily switch between them in the DACs list.
![Screenshot](config_gui.png)
>
-----------------
### #6 Plugin LMS
Some plugins in the LMS are not too necessary; you can deactivate them to make your system run smoother. Additionally, there are plugins that can conversion of your audio files, such as SqueezeDSP. I advise you not to activate it unless necessary.

Here are the plugins that I have activated:

- Additional Browse Modes
- Advanced Tag View
- Deezer
- Don't Stop The Music
- Material Skin
- mysqueezebox.com services handler
- Radio
- Random Mix
- Remote Music Libraries
-	Save Playlist
- Spotify for Squeezebox
- Tidal
- Qobuz
- YouTube
---------------------
### #7 Set up your music library in LMS.
![Screenshot](add-music.png)

-----------
### #8 App Control for LMSrAudio
![Screenshot](App_RuneAudio.jpg)
>
----------
### #9 Play on USB HDD
>
Initial configuration to listen to music directly (No need to scan) from USB (only needs to be done once). Next time, click on 'Disk and Folder' on the homepage to access USB/NAS.
>
![Screenshot](playonusb2.png)
>

-----------------------
### #10 Fixing NTFS Error to Mount USB HDD on rAudio

At times, you might encounter a situation where you want to mount your USB HDD device on rAudio, but it doesn't seem to work, and your USB device is not found in /mnt/MPD/USB/. Here's how you can potentially fix the NTFS error and make the USB HDD mount successfully.

First, open the Putty SSH terminal and run the following command to install the ntfs-3g package:
```bash
pacman -S ntfs-3g
```
Use the
```bash
 fdisk -l 
```
>
command to view the list of USB devices. For example, if your USB HDD device is labeled as /dev/sdb1, you can follow these steps:

To ensure that the device is not currently mounted, execute the command:
```bash
udevil umount /dev/sdb1
```
Run the ntfsfix command to attempt to fix errors on the USB device:
```bash
ntfsfix /dev/sdb1
```
Finally, use the udevil command to remount the device with the NTFS option:
```bash
udevil mount -t ntfs /dev/sdb1
```
>
I did this to successfully mount my NTFS HDD.
>

![Screenshot](NTFS-fix.png)
>
----------------------
### #11 Listening to music from the YouTube.com website on Touch LCD through a DAC
>
Instructions for listening to music from the YouTube.com website through a DAC and using the Raspberry Pi's Touch LCD screen to control YouTube playback on rAudio:

**Configure the Touch LCD**
>
Log in to SSH and enter the following command:
>
```bash
echo 'MOZ_USE_XINPUT2 DEFAULT=1' | sudo tee -a /etc/security/pam_env.conf
```

**Add the YouTube.com Website**
>
Enter the following command to replace "http://localhost" with "http://youtube.com" in the configuration file:
```bash
sudo sed -i 's#http://localhost#http://youtube.com#g' /srv/http/bash/xinitrc
```
**Navigate to the rAudio menu -> Features**
>
Enable "Browser on RPi."

To enhance your experience, you can also explore how to install ad-blocking extensions and a virtual keyboard extension. These two aspects have not been explored yet.
If you connect HDMI from the Pi to your TV, you can simultaneously watch and listen directly through the DAC. It's straightforward and doesn't require any YouTube API integration.

The control is intuitive. This setup has been tested and works well.

**You need to turn off the player before playing YouTube or [Tidal Connect](https://github.com/lovehifi/tidal-raudio-pi4).
>
------------
### #12 Listening to YouTube with LMS
**To use YouTube with LMS, you need to create and add the YouTube API to the LMS configuration. Here are the basic steps to accomplish this:**
>
https://www.youtube.com/watch?v=iqcIjP8Cel8
>
https://www.youtube.com/watch?v=0ZWaaKjxjzo
>
-------------
### #13 Tidal Connect
>
Set SQ64-rAudio (Squeezelite) status to Off and enable Tidal Connect automatically.
>
>
```bash

```
>
![Screenshot](tidal-connect.jpg)

>
-------------
## Build LMS-rAudio for Pi 2, Pi 3 and Pi 4
>
How to create a perfect and feature-rich Music Server-Player with a user-friendly, easy-to-use, and visually appealing interface, coupled with outstanding sound quality on your Raspberry Pi? Choose rAudio on the Arch Linux platform to turn this into a reality. (Pi 2, Pi 3, and Pi 4).
>
https://github.com/lovehifi/build-lms-sq-raudio
>
------------
>
## USB Wifi for rAudio Pi 4
>
Comfast CF-951AX (mt7921au chipset)
>
![Screenshot](cf_wifi_6.jpg)
>
TP-Link TL-WN822N(EU)
>
![Screenshot](TP-Link%20TL-WN822N.png)
![Screenshot](rAudio-Wifi.png)
>
--------------
>
### Set a Static IP Address
>
![Screenshot](static_ip.png)
>
>
----------------
## Why rAudio‐LMS?
https://github.com/lovehifi/raudiolms-32bit/wiki/Why-rAudio%E2%80%90LMS%3F
