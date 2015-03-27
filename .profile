# ~/.profile: executed by the command interpreter for login shells.
#
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Homebrew for OS X
[ "$(uname)" = Darwin -a -d /usr/local/bin ] && PATH="/usr/local/bin:${PATH//\/usr\/local\/bin:/}"

# If running bash include .bashrc if it exists
[ -n "$BASH_VERSION" -a -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
