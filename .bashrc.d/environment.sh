# Environment variables

# Setting up text editor
export EDITOR=/usr/bin/vim

# Python: don't write .py[co] files on import
export PYTHONDONTWRITEBYTECODE=yes

if [ "$(uname)" = Darwin ]; then
    # To eliminate problems with locale over ssh
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    # Solve problems with installing python modules that contain C extensions
    export CFLAGS="-I /opt/local/include $CFLAGS"
    export LDFLAGS="-L /opt/local/lib $LDFLAGS"

    # Add bin directory of Python interpreter to $PATH to be able to
    # locate package binaries installed by pip
    for python in python2.7 python3.4; do
        if which -s $python; then
            python_bin_path="$($python -c '__import__("sys").stdout.write(__import__("sys").prefix)')/bin"
            grep -qxF "$python_bin_path" <<< "${PATH//:/$'\n'}" || PATH="$PATH:$python_bin_path"
            unset python_bin_path
        fi
    done
    unset python
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
