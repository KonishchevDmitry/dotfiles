# Finalize command line prompt
PS1+='\$ '

# Colorize command line prompt
PS1="\[\033[01m\]$PS1\[\033[00m\]"
PS2="\[\033[01m\]$PS2\[\033[00m\]"
if [ "$UID" -eq 0 ]; then
    PS1="\[\033[31m\]$PS1"
    PS2="\[\033[31m\]$PS2"
fi

# Enable iTerm2 shell integration
if [ "$TERM_PROGRAM" = iTerm.app ]; then
    . ~/.bashrc.d/.iterm2_shell_integration.sh
fi
