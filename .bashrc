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
    nullglob="$(shopt -p nullglob)"
    shopt -s nullglob

    for file in ~/.bashrc.d/*.sh; do
        . $file
    done

    $nullglob
    unset file
    unset nullglob
fi

# Finalize command line prompt
PS1+='\$ '

PS1="\[\033[01m\]$PS1\[\033[00m\]"
PS2="\[\033[01m\]$PS2\[\033[00m\]"
if [ "$UID" -eq 0 ]; then
    PS1="\[\033[31m\]$PS1"
    PS2="\[\033[31m\]$PS2"
fi
