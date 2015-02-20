
exec i3

if [ -f ${HOME}/.Xdefaults ]
then
    xrdb ${HOME}/.Xdefaults &
fi

xmodmap ~/.xmodmap &

xbindkeys -f ~/.xbindkeysrc

echo '0.8' > ~/.opacityrc
