# On Fedora bash completion by default includes only git command completions and doesn't include git-prompt.sh
if [ -z "$(type -t __git_ps1)" ] && [ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Show current git branch in the command line prompt
if [ "$(type -t __git_ps1)" == "function" ]; then
    PS1+='$(__git_ps1 ":%s")'
fi
