#!/bin/bash

# Define variables
CONFIG_DIR="/home/$USER/.config"
POLYBAR_SCRIPTS_DIR="$CONFIG_DIR/polybar/scripts"
XRESOURCES_FILE=".Xresources"
USERHOME_DEST="/home/$USER"
XRESOURCES_BACKUP="$USERHOME_DEST/$XRESOURCES_FILE-bak"
ALIAS_LINE="alias pkexec='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'"

# Define variables for mpv (watch youtube from mpv)
YOUTUBE_SCRIPT="youtube-watch.sh"
YOUTUBE_SCRIPT_SRC="./i3/scripts/$YOUTUBE_SCRIPT"
YOUTUBE_SYMLINK_DEST="/usr/local/bin/$YOUTUBE_SCRIPT"

# Define variables i3exit script
I3EXIT_SCRIPT="i3exit"
I3EXIT_SCRIPT_SRC="./i3/scripts/$I3EXIT_SCRIPT"
I3EXIT_TARGET_DIR="/usr/local/bin/$I3EXIT_SCRIPT"

# Define variables tumblerd_cpu script
# https://wiki.archlinux.org/title/Thunar#Tumblerd_hangs_up,_uses_too_much_CPU
TUMBLERD_SCRIPT="tumblerd_cpu"
TUMBLERD_SCRIPT_SRC="./i3/scripts/$TUMBLERD_SCRIPT"
TUMBLERD_TARGET_DIR="/usr/local/bin/$TUMBLERD_SCRIPT"

# Set execute permission on both scripts
chmod +x "$YOUTUBE_SCRIPT_SRC" "$I3EXIT_SCRIPT_SRC" "$TUMBLERD_SCRIPT_SRC"

# Define function to exit script if Ctrl+C is pressed
function exit_on_ctrl_c() {
  echo "Script canceled by user"
  exit 1
}

# Trap Ctrl+C signal
trap exit_on_ctrl_c INT

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
if [ -f "$USERHOME_DEST/$XRESOURCES_FILE" ]; then
  mv "$USERHOME_DEST/$XRESOURCES_FILE" "$XRESOURCES_BACKUP"
fi

cp "$XRESOURCES_FILE" "$USERHOME_DEST/$XRESOURCES_FILE"

# Display message to inform user about root privileges and show contents of additional scripts
echo "+-------------------------------------------------------------------------------+"
echo "| Root privileges are required to create a symlink in                           |"
echo -e "| \033[1m/usr/local/bin\033[0m and make it executable.                          |"
echo "| Please enter your password when prompted.                                     |"
echo "+-------------------------------------------------------------------------------+"
echo ""
# Show contents of scripts
echo "+-------------------------------------------------------------------------------+"
echo "| Contents of youtube-watch.sh:                                                 |"
echo "+-------------------------------------------------------------------------------+"
cat "$YOUTUBE_SCRIPT_SRC" | sed 's/^/| /'
echo "+-------------------------------------------------------------------------------+"
echo ""
echo "+-------------------------------------------------------------------------------+"
echo "| Contents of i3exit:                                                           |"
echo "+-------------------------------------------------------------------------------+"
head -n 5 "$I3EXIT_SCRIPT_SRC" | sed 's/^/| /'
echo "| ..."
echo "| Check the full script at: $I3EXIT_SCRIPT_SRC"
echo "+-------------------------------------------------------------------------------+"
echo ""

# Remove existing symlinks for scripts if they exist
if [ -L "$YOUTUBE_SYMLINK_DEST" ]; then
  sudo rm "$YOUTUBE_SYMLINK_DEST"
fi
if [ -L "$I3EXIT_TARGET_DIR" ]; then
  sudo rm "$I3EXIT_TARGET_DIR"
fi
if [ -L "$TUMBLERD_TARGET_DIR" ]; then
  sudo rm "$TUMBLERD_TARGET_DIR"
fi

# Create symlinks for scripts
sudo ln -sf "$YOUTUBE_SCRIPT_SRC" "$YOUTUBE_SYMLINK_DEST"
sudo cp "$I3EXIT_SCRIPT_SRC" "$I3EXIT_TARGET_DIR"
sudo cp "$TUMBLERD_SCRIPT_SRC" "$TUMBLERD_TARGET_DIR"

# Install required packages
packages="git terminator python polkit polkit-gnome dunst i3 thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman nitrogen polybar ranger redshift mpv ffmpegthumbnailer xdotool rxvt-unicode rofi dmenu jq udisks2 w3m"

echo "The following packages will be installed:"
echo -e "\033[1m$packages\033[0m"
echo

read -p "Do you want to continue with the installation? [Y/n] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
  if ! sudo pacman -Sy --noconfirm $packages 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2); then
    echo "Failed to install packages."
    exit 1
  fi
else
  echo "Installation cancelled by user."
  exit 1
fi

# Check if Paru is installed
if command -v paru &> /dev/null
then
    aur_helper="paru"
# Check if Yay is installed
elif command -v yay &> /dev/null
then
    aur_helper="yay"
# Prompt user to select AUR helper if neither Paru nor Yay is installed
else
    PS3="Neither Paru nor Yay is installed. Please select an AUR helper: "
    options=("paru" "yay")
    select aur_helper in "${options[@]}"
    do
        case $aur_helper in
            "paru")
                sudo pacman -S --needed base-devel --noconfirm
                if ! git clone https://aur.archlinux.org/paru.git 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
                    echo "Failed to clone Paru repository."
                    exit 1
                fi
                cd paru
                if ! makepkg -si 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
                    echo "Failed to install Paru."
                    exit 1
                fi
                cd ..
                rm -rf paru
                break
                ;;
            "yay")
                sudo pacman -S --needed base-devel --noconfirm
                if ! git clone https://aur.archlinux.org/yay.git 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
                    echo "Failed to clone Yay repository."
                    exit 1
                fi
                cd yay-bin
                if ! makepkg -si 2> >(tee /dev/tty | sed 's/^/[ERROR] /' >&2) ; then
                    echo "Failed to install Yay."
                    exit 1
                fi
                cd ..
                rm -rf yay
                break
                ;;
            *)
                echo "Invalid option. Please select 1 or 2."
                ;;
        esac
    done
fi

# Install additional packages
$aur_helper -S --noconfirm networkmanager-dmenu-git pulseaudio-control drun3 picom-jonaburg-git

# Create .config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

# remove screenshot directory
rm -rf ./ss

# Define the path to the polybar config file
config_file="./polybar/config.ini"

# Prompt the user to enable the tray configuration
read -p "Do you want to enable the tray configuration? (y/n, default: n) " enable_tray

# Check if the user wants to enable the tray configuration
if [ "$enable_tray" = "y" ] || [ "$enable_tray" = "Y" ]; then
  # Remove the semicolon from the tray configuration
  sed -i 's/^;tray-/tray-/' "$config_file"
fi

# loop through the directories inside the i3wm-polybar directory
for dir in nitrogen polybar i3 dunst ranger redshift rofi terminator picom networkmanager-dmenu Thunar; do
    # check if the directory exists in the destination directory
    if [ -d "$CONFIG_DIR/$dir" ]; then
        bak_suffix="-bak"
        count=1
        # check if a -bak directory with a similar name exists
        while [ -d "$CONFIG_DIR/${dir}${bak_suffix}" ]; do
            # if it exists, increment the count and update the bak_suffix
            count=$((count+1))
            bak_suffix="-bak$count"
        done
        # rename the existing directory with the bak_suffix
        mv "$CONFIG_DIR/$dir" "$CONFIG_DIR/${dir}${bak_suffix}"
    fi
    # Copy contents of i3wm-polybar directory to the destination directory ~/.config
    cp -r "./$dir" "$CONFIG_DIR"
done

# Define the function to display the font values
display_font_values() {
	# Get the font suffixes from the polybar config
	fonts=$(grep -oP '(?<=font-[0-9] = ")[^:"]*' ./polybar/config)

	# Format the output with commas between the fonts
	formatted_fonts=$(echo "$fonts" | tr '\n' ',' | sed 's/,$//')

	# Echo the formatted fonts in bold text
	echo -e "\033[1m$formatted_fonts\033[0m"
}


echo
echo "Activating your new wallpaper..."
nitrogen --set-zoom-fill ./nitrogen/teal-mountain.jpg
echo "Done."
echo

# check if either .bashrc or .zshrc exists in USERHOME_DEST directory
if [ -f "$USERHOME_DEST/.bashrc" ]; then
  # append alias to .bashrc with new line
  # Check if the line already exists in the file
  if ! grep -qF "$ALIAS_LINE" "$USERHOME_DEST/.bashrc"; then
    # Append the line to the file
    echo -e "\n$ALIAS_LINE" >> "$USERHOME_DEST/.bashrc"
  fi
fi

if [ -f "$USERHOME_DEST/.zshrc" ]; then
  # append alias to .zshrc with new line
  # Check if the line already exists in the file
  if ! grep -qF "$ALIAS_LINE" "$USERHOME_DEST/.zshrc"; then
    # Append the line to the file
    echo -e "\n$ALIAS_LINE" >> "$USERHOME_DEST/.zshrc"
  fi
fi

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
echo "   Here's the list: $(display_font_values)"
echo
echo -e "   I'm using \033[1mSource Code Pro\033[0m in .Xresources file, you might want to install it or change it."
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
echo "9. You might want to update your thunar settings, you can check it in ~/.config/Thunar directory."
echo ""
echo "Thank you for using this setup script. Enjoy your i3wm-polybar setup!"
echo ""
