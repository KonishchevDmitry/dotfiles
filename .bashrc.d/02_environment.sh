# Environment variables

# Setting up text editor
export EDITOR="$(which vim)"

if [ "$(uname)" = Darwin ]; then
    # To eliminate problems with locale over ssh
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    export CFLAGS+=-I/usr/local/opt/openssl/include
    export LDFLAGS+=-L/usr/local/opt/openssl/lib
elif [ -f /etc/debian_version ]; then
    # Debian package building
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

# Set up virtualenvwrapper
export PROJECT_HOME=~/src

# Set up Python environment
if which pyenv >/dev/null; then
    eval "$(pyenv init -)"
    pyenv virtualenvwrapper_lazy
elif ! type -t mkvirtualenv > /dev/null && virtualenvwrapper=$(which virtualenvwrapper_lazy.sh 2>/dev/null); then
    . "$virtualenvwrapper"
fi
unset virtualenvwrapper

# Set up Rust environment
[ -d ~/.cargo/bin ] && export PATH=~/.cargo/bin":$PATH"
export RUST_BACKTRACE=1

# Set up Go workspace
export GOPATH=~/go
[ -d /usr/local/go ] && PATH="/usr/local/go/bin:$PATH"
[ -d "$GOPATH" ] && PATH="$GOPATH/bin:$PATH"

# On Linux it's libvirt by default
export VAGRANT_DEFAULT_PROVIDER=virtualbox
