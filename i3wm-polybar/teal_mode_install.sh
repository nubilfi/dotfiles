#!/bin/bash

# Define variables
CONFIG_DIR="/home/$USER/.config"
POLYBAR_SCRIPTS_DIR="$CONFIG_DIR/polybar/scripts"
XRESOURCES_FILE=".Xresources"
XRESOURCES_DEST="/home/$USER"
XRESOURCES_BACKUP="$XRESOURCES_DEST/$XRESOURCES_FILE-bak"

# Define variables for mpv (watch youtube from mpv)
YOUTUBE_SCRIPT="youtube-watch.sh"
YOUTUBE_SCRIPT_SRC="./i3/scripts/$YOUTUBE_SCRIPT"
YOUTUBE_SYMLINK_DEST="/usr/local/bin/$YOUTUBE_SCRIPT"

chmod +x "$YOUTUBE_SCRIPT_SRC"

# Check for internet connectivity
if ! ping -q -c 1 -W 1 archlinux.org &> /dev/null
then
    # Display message with frame if there's no internet access
    echo "+---------------------------------------------------------------------+"
    echo "| ERROR: No internet connection! Please check your network settings. |"
    echo "+---------------------------------------------------------------------+"
    exit 1
fi

# Copy .Xresources to destination directory with backup if file already exists
if [ -f "$XRESOURCES_DEST/$XRESOURCES_FILE" ]; then
  mv "$XRESOURCES_DEST/$XRESOURCES_FILE" "$XRESOURCES_BACKUP"
fi

cp "$XRESOURCES_FILE" "$XRESOURCES_DEST/$XRESOURCES_FILE"

# Display message to inform user about root privileges and show contents of youtube-watch.sh
echo "+-------------------------------------------------------------------------------+"
echo "| Root privileges are required to create a symlink to youtube-watch.sh in        |"
echo "| /usr/local/bin and make it executable.                                        |"
echo "| Please enter your password when prompted.                                      |"
echo "+-------------------------------------------------------------------------------+"
echo ""
echo "Contents of youtube-watch.sh:"
echo "+-------------------------------------------------------------------------------+"
cat "$YOUTUBE_SCRIPT_SRC" | sed 's/^/| /'
echo "+-------------------------------------------------------------------------------+"
echo ""

# Remove existing symlink for youtube-watch.sh if it exists
if [ -L "$YOUTUBE_SYMLINK_DEST" ]; then
  sudo rm "$YOUTUBE_SYMLINK_DEST"
fi

# Create symlink for youtube-watch.sh and make it executable with root privileges
sudo ln -sf "$YOUTUBE_SCRIPT_SRC" "$YOUTUBE_SYMLINK_DEST"

# Install required packages
if ! sudo pacman -Sy --noconfirm git terminator python polkit polkit-gnome dunst i3 thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman nitrogen polybar ranger redshift mpv ffmpegthumbnailer xdotool rxvt-unicode rofi dmenu jq udisks2 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
    echo "Failed to install packages."
    exit 1
fi

# Check if yay is installed
if ! command -v yay &> /dev/null
then
    # Install yay if it's not installed
    cd
    sudo pacman -S --needed base-devel --noconfirm
	
	if ! git clone https://aur.archlinux.org/yay-bin.git 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
		echo "Failed to clone Yay repository."
		exit 1
	fi

	cd yay-bin

	if ! makepkg -si 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
		echo "Failed to install Yay."
		exit 1
	fi

    cd ..
    rm -rf yay-bin
fi

# Install additional packages
yay -S --noconfirm networkmanager-dmenu-git pulseaudio-control drun3

# Create .config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

# Copy contents of i3wm-polybar directory to ~/.config directory
cp -r * "$CONFIG_DIR/"

# Additional instructions
echo "+------------------------------------------------------------+"
echo "|                                                            |"
echo "|       Congratulations! i3wm-polybar setup completed.       |"
echo "|                                                            |"
echo "+------------------------------------------------------------+"
echo ""
echo "Please perform the following additional steps:"
echo ""
echo "1. Check the system-fonts.zip files, please install manually, you can download it on the internet."
echo -e "\033[1m   I'm using Source Code Pro in .Xresources file, you might want to install it or change it.\033[0m"
echo ""
echo "2. Modify pulse config /etc/pulse/default.pa and add status false (if you want to use pulseaudio-control module)."
echo "   load-module module-stream-restore [restore-device=false]"
echo ""
echo "3. In ~/.config/redshift.conf file, don't forget to change the latitude & longitude value."
echo ""
echo "4. Auto detect mounted & not mounted removable devices."
echo "   - Create a new file /etc/udev/rules.d/95-usb.rules."
echo "   - Add the following lines to the file:"
echo "     KERNEL==\"sd*\", ACTION==\"add\", ATTR{removable}==\"1\", \\"
echo "         RUN+=\"$POLYBAR_SCRIPTS_DIR/system-usb-udev.sh --update\""
echo "     KERNEL==\"sd*\", ACTION==\"remove\", \\"
echo "         RUN+=\"$POLYBAR_SCRIPTS_DIR/system-usb-udev.sh --update\""
echo ""
echo "5. Enabling touchpad tap to click."
echo "   - Create a new file /etc/X11/xorg.conf.d/90-touchpad.conf."
echo "   - Add the following lines to the file:"
echo "     Section \"InputClass\""
echo "             Identifier \"touchpad\""
echo "             MatchIsTouchpad \"on\""
echo "             Driver \"libinput\""
echo "             Option \"Tapping\" \"on\""
echo "     EndSection"
echo ""
echo '6. Inside ~/.config/polybar/config file, you need to change the hwmon-path based on your system, please run the following command: $ for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done'
echo "   Then use one of the output path for hwmon-path."
echo ""
echo "7. Also change openweathermap attributes (KEY, UNITS, ID, CITY, SYMBOL) inside ~/.config/polybar/scripts/openweathermap-simple.sh file."
echo ""
echo "8. Run command: $ pacmd list-sink-inputs, you'll get the sink output for your machine then change the sink value for [module/pulse] inside ~/.config/polybar/config file and don't forget to change the sink name for [module/pulseaudio-control]"
echo ""
echo "9. Change the wallpaper from nitrogen config file, restart Laptop/Computer, select i3 from display manager. That's it."
echo ""
echo "Thank you for using this setup script. Enjoy your i3wm-polybar setup!"
echo ""

echo "Done."
