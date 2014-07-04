[ -n "$XTERM_VERSION" ] && transset -a 0.8 >/dev/null
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mawuena"
plugins=(git hirakata)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
ZSH=$HOME/.oh-my-zsh

alias ls='ls --color=always'
alias ll='ls -lha'
alias l='ls -lh'
alias cp='cp -v'
alias ne='emacs -nw'
alias m='make'
alias mr='make re'

# mount partitions
alias ddext='sudo mount -t ntfs-3g /dev/sdb1 ~/DDext';

# wifi
hookme () {
    sudo ifdown wlan0;sudo ifup wlan0=$1;
}

# screen brightness script
bright () {
    sudo echo -n $1 > /sys/class/backlight/acpi_video0/brightness
}

# edit zshrc
alias ezsh='emacs -nw ~/.zshrc;source ~/.zshrc';

install () {
    sudo aptitude install $1
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

alias wchat='weechat-curses';
alias ocaml='rlwrap ocaml';
alias sshot='xwd -root | convert - capture.png';

# receive netcat file transfer
receive () {
    nc -l -p $1;
}

alias recordDesktop='recordmydesktop --no-cursor --on-the-fly-encoding';

# M:tG
alias playmtg='wine ~/Windows/Program\ Files\ \(x86\)/Cockatrice/cockatrice.exe&'
alias mvdraft="mv Downloads/draft.cod Windows/Documents\ and\ Settings/Mawuena/AppData/Local/Cockatrice/Cockatrice/decks"
getdeck () {
    decktocod $1;
}

alias canop='sudo su - canopsis'

# Enable double screen
alias dscreen='xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --output VGA1 --mode 1920x1080 --pos 1366x0; feh --bg-scale /home/zdibe/.wallpaper.jpg'
