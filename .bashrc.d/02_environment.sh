# Environment variables

# Setting up text editor
export EDITOR="$(which vim)"

if [ "$(uname)" = Darwin ]; then
    # To eliminate problems with locale over ssh
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    export CFLAGS+=-I/opt/homebrew/opt/openssl/include
    export LDFLAGS+=-L/opt/homebrew/opt/openssl/lib

    # Fix SHELL variable which is set by the OS
    if [[ -n "$SHELL" && -n "$BASH" && "$SHELL" != "$BASH" ]]; then
        SHELL="$BASH"
    fi
elif [ -f /etc/debian_version ]; then
    # Debian package building
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

# Set up Rust environment
[ -d ~/.cargo/bin ] && [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]] && PATH="$HOME/.cargo/bin:$PATH"
export RUST_BACKTRACE=1

# Set up Go workspace
export GOPATH=~/go
[ -d "$GOPATH" ] && [[ ":$PATH:" != *":$GOPATH/bin:"* ]] && PATH="$GOPATH/bin:$PATH"

# On Linux it's libvirt by default
export VAGRANT_DEFAULT_PROVIDER=virtualbox
