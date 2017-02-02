# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Set base command line prompt (it could be modified later)
PS1='\h:\w'
PS2='> '

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

    for file in ~/.bashrc.d/*.sh; do
        [ "$enable_profiling" -eq 1 ] && start_time="$($date +%s%N)"
        . $file
        if [ "$enable_profiling" -eq 1 ]; then
            end_time="$($date +%s%N)"
            ((duration = (end_time - start_time) / 1000000))
            echo "$file: $duration ms"
        fi
    done

    $nullglob
    unset enable_profiling date nullglob file start_time end_time duration
fi

# Finalize command line prompt
PS1+='\$ '

PS1="\[\033[01m\]$PS1\[\033[00m\]"
PS2="\[\033[01m\]$PS2\[\033[00m\]"
if [ "$UID" -eq 0 ]; then
    PS1="\[\033[31m\]$PS1"
    PS2="\[\033[31m\]$PS2"
fi
