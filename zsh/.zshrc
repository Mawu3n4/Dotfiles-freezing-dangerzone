[ "$XTERM_VERSION" ] && transset -a $(cat ~/.opacityrc) >/dev/null

if [ -f $HOME/.antigen/antigen.zsh ]; then

    source $HOME/.antigen/antigen.zsh

    antigen-theme Zack--/zsh-files themes/mawuena

    antigen-bundle arialdomartini/oh-my-git
    antigen-bundle git

    # Pretty ZSH
    antigen-bundle zsh-users/zsh-syntax-highlighting
    antigen-bundle zsh-users/zsh-history-substring-search

    # Python Plugins
    antigen bundle pip
    antigen bundle python
    antigen bundle virtualenv

    # Personal stuff
    antigen-bundle Zack--/zsh-files

    antigen-apply
fi


if [ -f $ZSH/oh-my-zsh.sh ]; then
    ZSH_THEME="mawuena"
    plugins=(git hirakata)
    source $ZSH/oh-my-zsh.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
