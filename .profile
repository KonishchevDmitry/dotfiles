# ~/.profile: executed by the command interpreter for login shells.
#
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# MacPorts
if [ "$(uname)" = Darwin ]; then
    for macports_dir in /opt/local/{s,}bin; do
        [ -d "$macports_dir" ] && PATH="$macports_dir:$PATH"
    done
    unset macports_dir
fi

# If running bash include .bashrc if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
