# Environment variables

# Setting up text editor
export EDITOR="$(which vim)"

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

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

# Set up virtualenvwrapper
export PROJECT_HOME=~/src
export VIRTUALENVWRAPPER_PYTHON=$(which python3 2>/dev/null || which python2)
if ! type -t mkvirtualenv > /dev/null && virtualenvwrapper=$(which virtualenvwrapper.sh 2>/dev/null); then
    . "$virtualenvwrapper"
fi
unset virtualenvwrapper

# Set up Go workspace
export GOPATH=~/src/go
PATH="$PATH:$GOPATH/bin"

# Set up gvm (Go Version Manager)
[ -f ~/.gvm/scripts/gvm ] && . ~/.gvm/scripts/gvm

# On Linux it's libvirt by default
export VAGRANT_DEFAULT_PROVIDER=virtualbox
