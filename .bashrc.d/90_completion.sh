# Enable programmable completion features
# Note: in macOS bash completion doesn't work in stock /bin/bash
if ! shopt -oq posix && [ -z "$BASH_COMPLETION_COMPAT_DIR" ]; then
    [ "$(uname)" = Darwin ] && prefix=/opt/homebrew || prefix=""

    if [ -f "$prefix/usr/share/bash-completion/bash_completion" ]; then
        . "$prefix/usr/share/bash-completion/bash_completion"
    elif [ -f "$prefix/etc/bash_completion" ]; then
        . "$prefix/etc/bash_completion"
    fi

    unset prefix
fi
