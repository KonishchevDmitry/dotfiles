# Enable programmable completion features
# Note: in OS X bash completion don't work in stock /bin/bash
if ! shopt -oq posix; then
    [ "$(uname)" = Darwin ] && prefix=/usr/local || prefix=""

    if [ -f "$prefix/usr/share/bash-completion/bash_completion" ]; then
        . "$prefix/usr/share/bash-completion/bash_completion"
    elif [ -f "$prefix/etc/bash_completion" ]; then
        . "$prefix/etc/bash_completion"
    fi

    unset prefix
fi
