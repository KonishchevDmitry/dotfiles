# Adds Python programs installed via `python setup.py install --user` to the PATH
PATH="$PATH:$(python -c '__import__("sys").stdout.write(__import__("site").USER_BASE)')/bin"
