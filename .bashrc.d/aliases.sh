# Configure aliases

alias l='ls -lhaF'

alias g='gvim'
alias v='vim'

alias ag='ag --color-path 32 --color-line-number "1;38" --color-match "48;5;229"'

# git for dotfiles
dotfiles-git() { git --git-dir ~/.git-dir --work-tree ~ "$@"; }

# ssh to tmux session
ssh-tmux() { ssh "$@" -t -- 'tmux has-session 2>/dev/null || tmux new-session -d; exec tmux attach-session'; }
