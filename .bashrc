export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch() {
if git rev-parse --git-dir >/dev/null 2>&1
then
    gitver=$(git branch 2>/dev/null|sed -n '/^\*/s/^\* //p'|tr '/' '-'|awk '{print tolower($0)}')
else
    return 0
fi
echo -e $gitver
}

branch_color() {
if git rev-parse --git-dir >/dev/null 2>&1
then
    color=""
    if git diff --quiet 2>/dev/null >&2 
    then
        color="${c_green}"
    else
        color=${c_red}
    fi
else
    return 0
fi
echo -ne $color
}

PS1='$(parse_git_branch) \u@\w: ' # '\h:\W \u '

function title() { # set terminal tab title to $1
    export PROMPT_COMMAND="echo -ne '\033]0;$1\007'"
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Haskell GHC
# stack binaries install to .local/bin
export PATH="$HOME/.local/bin:$PATH"

export PYTHONSTARTUP=$HOME/dotfiles/pythonstartup.py

if [ -f /Users/jvai/Dropbox/bash.init ]; then
    source /Users/jvai/Dropbox/bash.init
fi

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by travis gem
[ -f /Users/jvai/.travis/travis.sh ] && source /Users/jvai/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
