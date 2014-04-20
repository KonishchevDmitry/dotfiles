# Environment variables

# Setting up text editor
export EDITOR=/usr/bin/vim

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

if [ "$(uname)" = Darwin ]; then
    # To eliminate problems with locale over ssh
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    # Add bin directory of main Python interpreter to $PATH to be able to
    # locate package binaries installed by pip
    if python_path="$(which python)"; then
        python_path="$(python -c '__import__("sys").stdout.write(__import__("sys").prefix)')/bin"
        grep -qxF "$python_path" <<< "${PATH//:/$'\n'}" || PATH="$PATH:$python_path"
    fi
    unset python_path
elif [ -f /etc/debian_version ]; then
    # Debian package building
    export DEBEMAIL='konishchev@gmail.com'
    export DEBFULLNAME='Dmitry Konishchev'
fi

# Set up virtualenvwrapper
if virtualenvwrapper=$(which virtualenvwrapper.sh); then
    export PROJECT_HOME=~/programs

    if python_path="$(which python3)"; then
        export VIRTUALENVWRAPPER_PYTHON="$python_path"
    fi
    unset python_path

    . "$virtualenvwrapper"
fi
unset virtualenvwrapper
