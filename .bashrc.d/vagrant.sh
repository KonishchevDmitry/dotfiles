# Configure Vagrant

# This script will be executed on user provisioning stage
# See https://github.com/KonishchevDmitry/ansible-vagrant
export VAGRANT_USER_PREP_SCRIPT=~/scripts/vagrant-user-prep

# ssh to Vagrant's tmux session
_vagrant_ssh_tmux() {
    local command="${1:-true}"

    vagrant ssh -- -t "
        # Installed by https://github.com/KonishchevDmitry/ansible-vagrant
        . ~/.bashrc.d/vagrant-user.sh

        # See ~/.bashrc.d/vagrant-user.sh for details about SSH_AUTH_SOCK
        tmux has-session 2>/dev/null || { unset SSH_AUTH_SOCK && tmux new-session -d && $command; } && exec tmux attach-session
    "
}

# ssh to Vagrant's tmux session
alias vagrant-ssh-tmux=_vagrant_ssh_tmux

# ssh to Vagrant's tmux session inside of the development virtualenv
alias vagrant-ssh-virtualenv='_vagrant_ssh_tmux "tmux send-keys \"workon vagrant\" Enter"'
