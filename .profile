# ~/.profile: executed by the command interpreter for login shells.
#
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# The default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Xorg has a bug: /etc/X11/xinit/xinitrc-common includes $HOME/.profile in addition to the one which may be sourced by
# the shell. So this file should be written to support to be sourced twice.

register_user_bin_path() {
    local path="$1"
    local escaped_slash_path="${path//\//\\\/}"

    PATH="${PATH//:$escaped_slash_path:/:}"
    PATH="${PATH#$path:}"
    PATH="${PATH%:$path}"

    [ -d "$path" ] && PATH="$path:$PATH"
}

# Configure environment for Homebrew
[ "$(uname)" = Darwin -a -e ~/.brew_profile ] && . ~/.brew_profile

# Private bins
register_user_bin_path "$HOME/bin"
register_user_bin_path "$HOME/.local/bin"

unset register_user_bin_path
