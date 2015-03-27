# Environment variables

# Setting up text editor
export EDITOR="$(which vim)"

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

if [ "$(uname)" = Darwin ]; then
    # To eliminate problems with locale over ssh
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
elif [ -f /etc/debian_version ]; then
    # Debian package building
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi

# Set up virtualenvwrapper
if virtualenvwrapper=$(which virtualenvwrapper.sh); then
    export PROJECT_HOME=~/programs
    . "$virtualenvwrapper"
fi
unset virtualenvwrapper
