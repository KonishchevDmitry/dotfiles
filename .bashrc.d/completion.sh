# Enable programmable completion features
# Note: in OS X bash completion will work only in /opt/local/bin/bash
if ! shopt -oq posix; then
    [ "$(uname)" = Darwin ] && prefix=/opt/local || prefix=""

    if [ -f "$prefix/usr/share/bash-completion/bash_completion" ]; then
        . "$prefix/usr/share/bash-completion/bash_completion"
    elif [ -f "$prefix/etc/bash_completion" ]; then
        . "$prefix/etc/bash_completion"
    fi

    unset prefix
fi
