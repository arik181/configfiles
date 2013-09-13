#!/usr/bin/env sh
ln    ~/Git/configfiles/.tmux.conf    ~/.tmux.conf
ln    ~/Git/configfiles/.vimrc        ~/.vimrc
rm -rf ~/.xmonad
ln -s ~/Git/configfiles/.xmonad       ~/.xmonad
rm -rf ~/.config/ranger
ln -s ~/Git/configfiles/ranger        ~/.config/ranger
ln    ~/Git/configfiles/.zshfunc      ~/.zshfunc
ln    ~/Git/configfiles/.zshrc.Linux  ~/.zshrc
ln    ~/Git/configfiles/.xinitrc      ~/.xinitrc
ln    ~/Git/configfiles/.xprofile     ~/.xprofile
ln    ~/Git/configfiles/.xsession     ~/.xsession
