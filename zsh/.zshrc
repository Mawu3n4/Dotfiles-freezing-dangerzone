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
    plugins=(hirakata hirakata hirakata git hirakata)
    source $ZSH/oh-my-zsh.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$PATH:$HOME/.npm-packages/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$HOME/Projects/tools/google_appengine:$PATH"

PATH="$HOME/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias grow="$HOME/bin/grow"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/Projects/tools/google_appengine:$PATH"
export PYTHONPATH="$HOME/Projects/tools/google_appengine:$PYTHONPATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/zack/Projects/tools/google-cloud-sdk/path.zsh.inc' ]; then source '/home/zack/Projects/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/zack/Projects/tools/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/zack/Projects/tools/google-cloud-sdk/completion.zsh.inc'; fi
