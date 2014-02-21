# Configures git completion and other handy things

# MacPorts' git-core package doesn't include git completion scripts into the
# system bash_completion.d directory
if [ "$(uname)" = Darwin ] && ! shopt -oq posix; then
    [ ! -f /opt/local/share/git-core/contrib/completion/git-prompt.sh ] \
        || . /opt/local/share/git-core/contrib/completion/git-prompt.sh

    [ ! -f /opt/local/share/git-core/contrib/completion/git-completion.bash ] \
        || . /opt/local/share/git-core/contrib/completion/git-completion.bash
fi

# Show current git branch in the command line prompt
__git_ps1 > /dev/null 2>&1 && PS1+='$(__git_ps1 ":%s")'
