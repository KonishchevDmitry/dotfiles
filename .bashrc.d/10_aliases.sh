# Configure aliases

alias l='ls -lhaF'
alias v='vim'

__is_light_background &&
    alias ag='ag --color-path 32 --color-line-number "1;38" --color-match "48;5;229"'

# git for dotfiles
dotfiles-git() { git --git-dir ~/.git-dotfiles --work-tree ~ "$@"; }
private-dotfiles-git() { git --git-dir ~/.git-private-dotfiles --work-tree ~ "$@"; }

# ssh to tmux session
ssh-tmux() {
    ssh -t "$@" -- tmux new-session -A -s ssh
}

# ssh to tmux session on the home server
server() {
    local host="server.lan"
    {
        # General case: relying on DNS
        # host -a -W 1 "$host" > /dev/null 2>&1

        # VPN workaround: VPN overrides DNS, but IP is in /etc/hosts
        ping -c 3 -i 0.1 -t 1 -o server.lan > /dev/null 2>&1
    } || host="konishchev.ru"

    if [ "$1" == ssh ]; then
        ssh-tmux "$host"
    else
        mosh "$host" -- tmux new-session -A -s ssh
    fi
}

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
