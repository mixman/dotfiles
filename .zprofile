if [ "$(uname -p)" = 'arm' ]; then
eval "$(/opt/homebrew/bin/brew shellenv)"
else
eval "$(/usr/local/bin/brew shellenv)"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

##
# Your previous /Users/jvai/.zprofile file was backed up as /Users/jvai/.zprofile.macports-saved_2021-03-08_at_15:03:42
##

# MacPorts Installer addition on 2021-03-08_at_15:03:42: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2021-03-08_at_15:03:42: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2021-03-08_at_15:03:42: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.

