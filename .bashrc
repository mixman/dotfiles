export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PYTHONPATH="/Users/jvai:$PYTHONPATH"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=/opt/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

#export LANG="en_en.UTF-8"
#export LC_COLLATE="en_en.UTF-8"
#export LC_CTYPE="en_en.UTF-8"
#export LC_MESSAGES="en_en.UTF-8"
#export LC_MONETARY="en_en.UTF-8"
#export LC_NUMERIC="en_en.UTF-8"
#export LC_TIME="en_en.UTF-8"
#export LC_ALL=

# android (phonegap)
export PATH=$PATH:$HOME/Documents/mobile/adt-bundle-mac/sdk/tools:$HOME/Documents/mobile/adt-bundle-mac/sdk/platform-tools
# appcelerator
export PATH+=$PATH:/usr/local/share/npm/bin

# git branch on bash shell
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
if git rev-parse --git-dir >/dev/null 2>&1
then
    gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
else
    return 0
fi
echo -e $gitver
}

branch_color ()
{
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

PS1='[\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]] \u@\[${c_black}\]\w\[${c_sgr0}\]: '

function title() {
    # set terminal tab title to $1
    export PROMPT_COMMAND="echo -ne '\033]0;$1\007'"
}
