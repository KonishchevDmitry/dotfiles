# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set base command line prompt (it could be modified later)
PS1='\h:\w'
PS2='> '

# If we aren't run inside systemd user session (connected by ssh for example), include its environment configuration
if [ -z "$MANAGERPID" -a -d ~/.config/environment.d ]; then
    nullglob="$(shopt -p nullglob)"
    shopt -s nullglob
    files=~/.config/environment.d/*.conf
    $nullglob

    ssh_auth_sock="$SSH_AUTH_SOCK"

    for file in $files; do
        set -o allexport
        . $file
        set +o allexport
    done

    [ -z "$ssh_auth_sock" ] || SSH_AUTH_SOCK="$ssh_auth_sock"

    unset nullglob files file ssh_auth_sock
fi

# Include custom settings
if [ -d ~/.bashrc.d ]; then
    enable_profiling=0

    if [ "$enable_profiling" -eq 1 ]; then
        if [ "$(uname)" = Darwin ]; then
            date=gdate
        else
            date=date
        fi
    fi

    nullglob="$(shopt -p nullglob)"
    shopt -s nullglob
    files=~/.bashrc.d/*.sh
    $nullglob

    for file in $files; do
        [ "$enable_profiling" -eq 1 ] && start_time="$($date +%s%N)"
        . $file
        if [ "$enable_profiling" -eq 1 ]; then
            end_time="$($date +%s%N)"
            ((duration = (end_time - start_time) / 1000000))
            echo "$file: $duration ms"
        fi
    done

    unset enable_profiling date nullglob files file start_time end_time duration
fi
