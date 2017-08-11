# Configure aliases

alias l='ls -lhaF'

alias g='gvim'
alias v='vim'

__is_light_background &&
    alias ag='ag --color-path 32 --color-line-number "1;38" --color-match "48;5;229"'

# git for dotfiles
dotfiles-git() { git --git-dir ~/.git-dotfiles --work-tree ~ "$@"; }
os-dotfiles-git() { git --git-dir ~/.git-os-dotfiles --work-tree ~ "$@"; }
private-dotfiles-git() { git --git-dir ~/.git-private-dotfiles --work-tree ~ "$@"; }

# ssh to tmux session
# If called as `ssh-tmux -A` ssh agent will be properly forwarded into tmux session.
# If called as `ssh-tmux` it's expected that agent is available on remote host at ~/.ssh/tmux-agent.socket.
ssh-tmux() {
    ssh "$@" -t -- '
        agent_socket=~/.ssh/tmux-agent.socket

        if [ -n "$SSH_AUTH_SOCK" -a -e "$SSH_AUTH_SOCK" -a ! "$agent_socket" -ef "$SSH_AUTH_SOCK" ]; then
            install -d -m 700 ~/.ssh && rm -f "$agent_socket" && ln -s "$SSH_AUTH_SOCK" "$agent_socket"
        fi

        export SSH_AUTH_SOCK="$agent_socket"

        # TODO: May be replaced by `tmux new-session -A -s admin` for new tmux versions
        tmux has-session -t ssh 2>/dev/null || tmux new-session -s ssh -d
        exec tmux attach-session -t ssh
    '
}

# ssh to tmux session on the home server
server() {
    local host="server.lan"
    host -a -W 1 "$host" > /dev/null 2>&1 || host="konishchev.ru"

    if [ "$1" == ssh ]; then
        ssh-tmux "$host"
    else
        mosh "$host" sbin/mosh-tmux-login
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
