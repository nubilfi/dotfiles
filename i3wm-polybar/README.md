# i3 and Polybar Configs

First of all, install the requirement packages, I'm using Archlinux, so please find all related packages name according to your Linux distro.

`sudo pacman -Sy i3 dunst ranger jq udisks2 nitrogen rofi dmenu redshift mpv ffmpegthumbnailer drun3`, after all those packages installed, we need to install another package from AUR, which is `Polybar`. I'm going to use `Polybar` for creating status bars. `yay -S Polybar networkmanager-dmenu-git pulseaudio-control`.

There are some modifications for polybar scripts to work properly, here are some of them:

- Extract fonts to `~/.config/local/share/fonts` and run command `fc-cache -f -v` (Only install the font based on polybar config).

- Copy dunst, i3, nitrogen, ranger, polybar directory to `~/.config/`.

- Modify pulse config `/etc/pulse/default.pa` and add status false (if you want to use pulseaudio-control module)

  ```
  load-module module-stream-restore [restore-device=false]
  ```

- Copy redshift.conf to `~/.config/` and don't forget to change latitude, longitude value

- Copy .Xresources `~/home`

- Auto detect mounted & not mounted removable devices.

  `sudo nano /etc/udev/rules.d/95-usb.rules`
  ```
  KERNEL=="sd*", ACTION=="add", ATTR{removable}=="1", \
      RUN+="/home/username/.config/polybar/scripts/system-usb-udev.sh --update"
  KERNEL=="sd*", ACTION=="remove", \
      RUN+="/home/username/.config/polybar/scripts/system-usb-udev.sh --update"
  ```
- Enabling touchpad tap to click.

  `sudo nano /etc/X11/xorg.conf.d/90-touchpad.conf`
  ```
  Section "InputClass"
          Identifier "touchpad"
          MatchIsTouchpad "on"
          Driver "libinput"
          Option "Tapping" "on"
  EndSection
  ```

Change the wallpaper from nitrogen config file, restart Laptop/Computer, select i3 from display manager. That's it.

