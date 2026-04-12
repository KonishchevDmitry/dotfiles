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

# Usage:
# $ shell_command; notify
notify () {
    local rc=$?

    local status
    local message

    [ "$rc" -eq 0 ] && status=Success || message=Failure
    message="$(history 1 | sed -E 's/^[[:space:]]*[0-9]+([[:space:]]+[0-9]{4}\.[0-9]{2}\.[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})?[[:space:]]+(.+?)[[:space:]]*;[[:space:]]*notify[[:space:]]*$/\2/')"

    if [ "$(uname)" = Darwin ]; then
        terminal-notifier -title "$status" -message "$message"
    elif [ -n "$TMUX" ]; then
        # -S: to be able to notify from `sudo -i`
        # -h: two lines for the border and one line for less status line which can't be hidden
        tmux -S "${TMUX%%,*}" display-popup -h 4 -T "$status" ~/.local/libexec/render-tmux-popup "$message"
    else
        echo "Notification aren't supported in current configuration." >&2
    fi

    return $rc
}
