# Show current git branch in the command line prompt
__git_ps1 > /dev/null 2>&1 && PS1+='$(__git_ps1 ":%s")'
