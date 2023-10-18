# Tips for using rAudio and LMS
## #1 Add NAS to rAudio
![Screenshot](001.jpg)
![Screenshot](002a.jpg)
![Screenshot](003.jpg)
>
--------
>
#### Listen to music from your NAS (or PC) with LMS on rAudio.
![Screenshot](004.jpg)
![Screenshot](005.jpg)
>
-------
>
## #2 Install htop 64 bit
>
> cd /tmp && wget http://ftp.tku.edu.tw/Linux/ArchLinux-arm/aarch64/extra/htop-3.2.2-1-aarch64.pkg.tar.xz
>
> pacman -U htop-3.2.2-1-aarch64.pkg.tar.xz
>
-----------------
## #3 NFS IP in fstab
>
> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/mountnfs | sh
>
-----------------
## #4 Eqfa12 LMS
>
> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/eqfa12lms | sh
>
-----------------
## #5 Config GUI LMS
>
> wget -O - https://raw.githubusercontent.com/lovehifi/addraudio/main/configgui | sh
>
-----------------
## #6 Plugin LMS
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
