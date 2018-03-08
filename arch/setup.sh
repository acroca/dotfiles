# Install everything
sudo pacman -S vim pacaur i3 xorg xorg-xinit dmenu termite chromium xorg-xdm xdm-archlinux compton
pacaur -S code polybar-git ttf-meslo

# Enable XDM
sudo systemctl enable xdm-archlinux.service

# Copy config files
cp i3_config ~/.config/i3
cp polybar_config ~/.config/polybar
cp termite_config ~/.config/termite
cp .xsession ~

