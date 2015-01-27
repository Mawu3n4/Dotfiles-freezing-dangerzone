xmodmap ~/.xmodmap &

if [ -f ${HOME}/.Xdefaults ]
then
    xrdb ${HOME}/.Xdefaults &
fi

exec i3

