[ -n "$XTERM_VERSION" ] && transset -a 0.8 >/dev/null
export HOST=Command\&Control
export USER=Mawu3n4

# Path to your oh-my-zsh configuration.-
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

alias twit='~/.ttyter_script.sh'
alias ls='ls --color=always'
alias ll='ls -lh'
alias l='ll'
alias cp='cp -v'
alias ne='emacs -nw'
alias m='make'
alias mr='make re'
alias MusicPlease='cd ~/Music ; ./a.out > .errors &';

# subversion script
alias sco='/home/clrdr/./.sco'

alias gopub='cd /afs/epitech.net/users/all/dibe_z/public'
alias goastek='cd /afs/epitech.net/users/all/astek/public'

alias ib='/home/clrdr/.instantbird/instantbird/instantbird&'
# $mod + L
alias lock='i3lock -i/home/clrdr/.lockscreen.png -t -u'

# mount partitions
alias Fedo='sudo mount /dev/sda5 ~/FedoStd ; cd ~/FedoStd/';
alias Deb='sudo mount /dev/sda10 ~/Debian ; cd ~/Debian/home/dibez/';
alias Win='sudo mount -t ntfs-3g -o remove_hiberfile /dev/sda2 /home/clrdr/Windows ;  cd ~/Windows/Documents\ and\ Settings/Mawuena/Downloads';
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

#alias cat='pygmentize -O style=monokai -f console256 -g';

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

alias fatality='cvlc ~/.fatality.mp3&';

# receive netcat file transfer
receive () {
    nc -l -p $1;
}

alias recordDesktop='recordmydesktop --no-cursor --on-the-fly-encoding';

# M:tG
alias playmtg='wine ~/Windows/Program\ Files\ \(x86\)/Cockatrice/cockatrice.exe&';
alias mvdraft="mv Downloads/draft.cod Windows/Documents\ and\ Settings/Mawuena/AppData/Local/Cockatrice/Cockatrice/decks"
getdeck () {
    decktocod $1;
}