export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/go

if [ "$(uname -p)" = "arm" ]; then
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export PATH="$HOME/.ghcup/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
else # rosetta
export GHCUP_INSTALL_BASE_PREFIX=/opt
[ -f "/opt/.ghcup/env" ] && source "/opt/.ghcup/env" # ghcup-env
[ -f "/usr/local/Homebrew/bin/brew" ] && eval "$(/usr/local/Homebrew/bin/brew shellenv)"
export PATH="/usr/local/Homebrew/opt/llvm/bin:$PATH"
#export PATH="/opt/.ghcup/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ $(command -v starship) ] && eval "$(starship init zsh)"

# conda init zsh
#If you'd prefer that conda's base environment not be activated on startup,
#conda config --set auto_activate_base false
go_conda() {
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jussi.vaihia@futurice.com/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jussi.vaihia@futurice.com/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jussi.vaihia@futurice.com/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jussi.vaihia@futurice.com/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
}

parse_git_branch() {
if git rev-parse --git-dir >/dev/null 2>&1
then
    gitver=$(git branch 2>/dev/null|sed -n '/^\*/s/^\* //p'|tr '/' '-'|awk '{print tolower($0)}')
else
    return 0
fi
echo -e $gitver
}

eval "$(direnv hook zsh)"


export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
export GPG_TTY=$(tty)
