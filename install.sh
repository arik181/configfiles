#!/usr/bin/env sh
rm -rf ~/.tmux.conf
rm -rf ~/.vimrc
rm -rf ~/.xmonad
rm -rf ~/.zshfunc
rm -rf ~/.zshrc
rm -rf ~/.xinitrc
rm -rf ~/.xprofile
rm -rf ~/.xsession
rm -rf ~/.config/sway

mkdir ~/.config/sway

ln -s ~/Git/configfiles/.tmux.conf    ~/.tmux.conf
ln -s ~/Git/configfiles/.vimrc        ~/.vimrc
ln -s ~/Git/configfiles/.xmonad       ~/.xmonad
ln -s ~/Git/configfiles/.zshfunc      ~/.zshfunc
ln -s ~/Git/configfiles/.zshrc.Linux  ~/.zshrc
ln -s ~/Git/configfiles/.xinitrc      ~/.xinitrc
ln -s ~/Git/configfiles/.xprofile     ~/.xprofile
ln -s ~/Git/configfiles/.xsession     ~/.xsession
ln -s ~/Git/configfiles/config     ~/.config/sway/config
