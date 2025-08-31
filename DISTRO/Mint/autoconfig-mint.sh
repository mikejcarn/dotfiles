#!/bin/sh

#AUTOCONFIGURATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#SYSCONFIG -------------------------------------------------

#Configuration files
cp -r ./nvim ~/.config/
cp -r ./kitty ~/.config/
cp -r ./starship.toml ~/.config/
cp -r ./.bashrc ~/
cp -r ./.zshrc ~/
cp -r ./.zshenv ~/

#Wallpapers for Workspaces
cp -r ./images/workspace-images ~/Pictures
mkdir -p ~/.local/bin
cp ./scripts/workspace_background_switcher.sh ~/.local/bin
cp ./scripts/workspace_background_switcher.desktop ~/.config/autostart/
# gsettings set org.cinnamon.desktop.background picture-uri "file:$HOME/Pictures/workspace-images/chill1.jpg"

#Run Workspace Background Switcher as daemon in first session
chmod 777 ~/.local/bin/workspace_background_switcher.sh
setsid ~/.local/bin/workspace_background_switcher.sh >/dev/null 2>&1 </dev/null &

#Python formatting support
cp ./scripts/black ~/.local/bin

#Copy scripts to ~/.local/bin
mkdir ~/bin
cp -r ./scripts/toggle_remove_titlebar.sh ~/bin

#Change Start Menu Icon
sudo cp ./images/start-icon/1Up.svg /usr/share/icons/hicolor/scalable/apps/linuxmint-logo-ring-symbolic.svg
#Original put in ./Pictures
cp ./images/start-icon/Ed.png ~/Pictures

#Audio
sudo cp ./sounds/* /usr/share/mint-artwork/sounds/

#dconf Cinnamon Configuration
dconf load /org/cinnamon/ <./dconf.txt

#Guake Configuration
dconf load /apps/guake/ <./guake_prefs
#Guake Autostart on Login
cp ./Guake.desktop ~/.config/autostart

#CAPS to ESC + SHIFT-CAPS to CAPS
xmodmap -e "clear Lock"
xmodmap -e "keycode 66 = Escape Caps_Lock"
#Make changes permanent
xmodmap -pke >~/.xmodmap
xmodmap ~/.xmodmap

#Fonts -----------------------------------------------------

#Create Font Folders for All Users
sudo mkdir /usr/share/fonts/opentype/VictorMono
sudo mkdir /usr/share/fonts/opentype/FiraCodeNerdFont
#Unzip & Install Fonts
sudo unzip ./fonts/VictorMono_OTF.zip -d /usr/share/fonts/opentype/VictorMono
sudo unzip ./fonts/FiraCodeNerdFont_OTF.zip -d /usr/share/fonts/opentype/FiraCodeNerdFont

#Install Fonts
apt install fonts-firacode

#INSTALLERS ------------------------------------------------

#Update Installers
apt update

#Install Programs
apt install chromium-browser -y

#Install Icons
wget -qO- https://git.io/papirus-icon-theme-install | sh

#Install and Execute ZSH
apt install zsh -y
sleep 5
zsh
