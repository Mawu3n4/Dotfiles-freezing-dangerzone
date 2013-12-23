#!/bin/bash

ROOT_UID="0"

if [ "$UID" -ne "$ROOT_UID" ] ; then
    echo "You must be root to do that!"
    exit 1
fi

cp ./i3/config ~/.i3/
cp ./i3/i3status.conf /etc/

cp ./X/.Xdefaults ~/
cp ./zsh/.zshrc ~/
cp ./zsh/crunch.zsh-theme ~/.oh-my-zsh/themes/

cp -r ./slim/binary /usr/share/slim/themes/
cp ./slim/slim.conf /etc/

cp ./bin/decktocod ./bin/switchlayout /bin/
