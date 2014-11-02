# Configures git completion and other handy things

# __git_ps1 is not included to bash completion
[ "$(uname)" = Darwin ] && ! shopt -oq posix && \
    [ -f /opt/local/share/git/git-prompt.sh ] && . /opt/local/share/git/git-prompt.sh

# Show current git branch in the command line prompt
__git_ps1 > /dev/null 2>&1 && PS1+='$(__git_ps1 ":%s")'
