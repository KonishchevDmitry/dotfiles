# Show current git branch in the command line prompt
if [ "$(type -t __git_ps1)" == "function" ]; then
    PS1+='$(__git_ps1 ":%s")'
fi
