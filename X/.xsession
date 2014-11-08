xmodmap ~/.xmodmap &

if [ -f ${HOME}/.Xdefaults ]
then
    xrdb ${HOME}/.Xdefaults &
fi

exec i3

modprobe -r b43 ssb wl && modprobe wl&
