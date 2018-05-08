#!/bin/bash

ROOT_UID="0"

GREEN="[0;32m"
RED="[0;31m"
CLEAN="[0m"

DF=$(pwd)
UPDATE=0


info() {
    echo $GREEN"[+] "$CLEAN$1
}

error() {
    echo $RED"[-] "$CLEAN$1
}

link() {
    if [ -e $2 ] || [ -d $2 ] || [ -L $2 ]
    then
        if [ "$UPDATE" == 1 ]
        then
            rm -rf $2
            info "removed $2"
        else
            error "failed to create symbolic link '$2': File exists"
            return
        fi
    fi
    ln -s $1 $2
}

while test $# -gt 0; do
    case "$1" in
        -u | --update)
            if [ "$UPDATE" == 0 ]; then UPDATE=1; fi
            shift
            ;;
        *)
            error "Unkown argument $1"
            shift
            ;;
    esac
done

git submodule init
git submodule update

info "Configuring i3wm... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/i3 $HOME/.i3
info "done"

info "Configuring Conky... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/conky/.conkyrc $HOME/.conkyrc
info "done"

info "Configuring X options... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/unix/.Xdefaults $HOME/.Xdefaults
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/unix/.xsession $HOME/.xsession
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/unix/.xmodmap $HOME/.xmodmap
info "done"


info "Configuring ZSH... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/zsh/.zshrc $HOME/.zshrc
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/zsh/.opacityrc $HOME/.opacityrc
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/zsh/oh-my-zsh/theme/mawuena.zsh-theme $HOME/.oh-my-zsh/themes/mawuena.zsh-theme
git clone https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
info "done"

info "Configuring weechat... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/weechat/irc.conf $HOME/.weechat/irc.conf
info "done"

info "Configuring GHCI... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/ghci/.ghci $HOME/.ghci
info "done"

info "Configuring scripts... "
link $DK/bin $HOME/.bin
info "done"

info "Configuring eMacs... "
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/emacs/.emacs $HOME/.emacs
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/emacs/.emacs.d $HOME/.emacs.d
info "done"


info "Configuring slim... "
if [ "$UID" -ne "$ROOT_UID" ] ; then
    error "You must be root to do that!"
    exit 1
fi
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/slim/binary /usr/share/slim/themes/binary
link $DF/Projects/Github/Dotfiles-freezing-dangerzone/slim/slim.conf /etc/slim.conf
info "done"

UPDATE=0
