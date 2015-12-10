xset s off
xbindkeys -f ~/.xbindkeysrc
echo '0.75' > ~/.opacityrc

if [ -f ${HOME}/.Xdefaults ]
then
    xrdb ${HOME}/.Xdefaults &
fi

exec i3

