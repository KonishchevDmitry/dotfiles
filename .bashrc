# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set up email checking
if [ "$UID" -eq 0 ]; then
    MAIL_PATH=/var/mail/$USER
    shopt -s mailwarn
else
    shopt -u mailwarn
fi

# Enable extended pattern matching
shopt -s extglob

# Patterns which match no files expands to a null string, rather than
# themselves.
#
# Sadly, doesn't work well on all distros in interactive mode. :(
#shopt -s nullglob

# Append to the history file, don't overwrite it
shopt -s histappend

# Write history every time bash shows the prompt
if ! echo "$PROMPT_COMMAND" | grep -qF 'history -a'; then
    if echo "$PROMPT_COMMAND" | egrep -q ';[[:space:]]*$'; then
        PROMPT_COMMAND+="; "
    fi
    PROMPT_COMMAND+="history -a;"
fi

# Автоматическое исправление ошибок в именах каталогов при выполнении команды cd
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Do not add duplicated commands and commands starting from space to the
# history.
for hist_option in ignoredups ignorespace; do
    if ! echo "$HISTCONTROL" | grep -q "$hist_option"; then
        if [ "$HISTCONTROL" == "" ]; then
            HISTCONTROL="$hist_option"
        else
            HISTCONTROL="$HISTCONTROL:$hist_option"
        fi
    fi
done
unset hist_option

# Do not write the following commands to the history
HISTIGNORE="cd"


# Command line prompt -->
    PS1='\h:\w'
    __git_ps1 > /dev/null 2>&1 && PS1+='$(__git_ps1 ":%s")'
    PS1+='\$ '
    PS2='> '

    PS1="\[\033[01m\]$PS1\[\033[00m\]"
    PS2="\[\033[01m\]$PS2\[\033[00m\]"
    if [ "$UID" -eq 0 ]; then
        PS1="\[\033[31m\]$PS1"
        PS2="\[\033[31m\]$PS2"
    fi
# Command line prompt <--


# Aliases
alias l='ls -laF'
alias ms='grep -EHnr --color=always'
alias g='gvim'
alias v='vim'
alias y='yes " "'


if [ -f /etc/debian_version ]; then
    # Debian package building
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi


# Setting up text editor
export EDITOR=/usr/bin/vim

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes


# Include custom settings
if [ -d ~/.bashrc.d ]; then
    for file in ~/.bashrc.d/*.sh; do
        [ -r $file ] && . $file
    done
    unset file
fi
