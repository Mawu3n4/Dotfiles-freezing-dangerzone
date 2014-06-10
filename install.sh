#!/bin/bash

ROOT_UID="0"

GREEN="[0;32m"
RED="[0;31m"
CLEAN="[0m"

DF=$(pwd)

print_ok() {
    echo $GREEN"OK"$CLEAN$1
}

print_ko() {
    echo $RED"KO"$CLEAN$1
}

if [ "$UID" -ne "$ROOT_UID" ] ; then
    echo "$RED[-]$CLEAN You must be root to do that!"
    exit 1
fi

echo "$GREEN[+]$CLEAN Configuring i3wm... "
cp $DF/i3/config $HOME/.i3/
cp $DF/i3/i3status.conf /etc/
print_ok "done"

echo "$GREEN[+]$CLEAN Configuring X options... "
cp $DF/X/.Xdefaults $HOME/
cp $DF/X/.xsession $HOME/
cp $DF/X/.xmodmap $HOME/
print_ok "done"

echo "$GREEN[+]$CLEAN Configuring ZSH... "
cp $DF/zsh/.zshrc $HOME/
cp $DF/zsh/mawuena.zsh-theme $HOME/.oh-my-zsh/themes/
print_ok "done"

echo "$GREEN[+]$CLEAN Configuring slim... "
cp -r $DF/slim/binary /usr/share/slim/themes/
cp $DF/slim/slim.conf /etc/
print_ok "done"

echo "$GREEN[+]$CLEAN Misc configurations... "
cp $DF/bin/decktocod $DF/bin/switchlayout /bin/
print_ok "done"

echo "$GREEN[+]$CLEAN Configuring weechat... "
cp $DF/weechat/irc.conf $HOME/.weechat/
echo "done"

echo "$GREEN[+]$CLEAN Configuring GHCI... "
cp $DF/ghci/.ghci $HOME/
echo "done"

echo "$GREEN[+]$CLEAN Wallpeppers... "
cp $DF/wallpaper/.wallpaper.jpg $HOME/
cp $DF/wallpaper/.wallpaper.jpg $HOME/
echo "done"