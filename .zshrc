[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jvai/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jvai/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jvai/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jvai/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

export GOPATH=$HOME/go


# git status
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
# /git status

aws_profile() {
[[ -z $AWS_PROFILE ]] && return
echo -e " {$AWS_PROFILE}"
}

setopt PROMPT_SUBST
PROMPT='$(parse_git_branch)$(aws_profile) %n@%~ %# '

# starship.rs
eval "$(starship init zsh)"
