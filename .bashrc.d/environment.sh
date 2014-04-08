# Environment variables

# Debian package building
if [ -f /etc/debian_version ]; then
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi

# Setting up text editor
export EDITOR=/usr/bin/vim

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

# To eliminate problems with locale over ssh
if [ "$(uname)" = Darwin ]; then
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi
