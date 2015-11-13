# Configure aliases

alias l='ls -lhaF'

alias g='gvim'
alias v='vim'

# Try to use ack instead of grep
#alias ms='grep -EHnr'

# git for dotfiles
dotfiles-git() { git --git-dir ~/.git-dir "$@"; }

# ssh to tmux session
ssh-tmux() { ssh "$@" -t -- 'tmux has-session 2>/dev/null || tmux new-session -d; exec tmux attach-session'; }
