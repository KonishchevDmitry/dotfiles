# Configure command line utilities

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ "$(uname)" = Darwin ]; then
    # OS X notifications from terminal
    #
    # Usage:
    # $ shell_command; notify
    notify () {
        local rc=$?
        local status
        [ "$rc" -eq 0 ] && status='Success:' || status='Failure:'
        local message="$(history | sed -nE '$ s/^[[:space:]]*[0-9]+[[:space:]]*(.*)[[:space:]]*;[[:space:]]*notify[[:space:]]*$/\1/ p')"
        terminal-notifier -message "$status $message"
        return $rc
    }
fi

# ssh to tmux session on the home server
server() {
    local host="server.lan"
    host -a -W 1 "$host" > /dev/null 2>&1 || host="konishchev.ru"

    if [ "$1" == ssh ]; then
        ssh "$host" -t -- tmux new-session -A -s admin
    else
        mosh "$host" -- tmux new-session -A -s admin
    fi
}
