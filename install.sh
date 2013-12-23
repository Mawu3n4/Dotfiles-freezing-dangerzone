#!/bin/bash

ROOT_UID="0"
home=$HOME

if [ "$UID" -ne "$ROOT_UID" ] ; then
    echo "You must be root to do that!"
    exit 1
fi

cp ./i3/config $home/.i3/
cp ./i3/i3status.conf /etc/

cp ./X/.Xdefaults $home/
cp ./zsh/.zshrc $home/
cp ./zsh/crunch.zsh-theme $home/.oh-my-zsh/themes/

cp -r ./slim/binary /usr/share/slim/themes/
cp ./slim/slim.conf /etc/

cp ./bin/decktocod ./bin/switchlayout /bin/
