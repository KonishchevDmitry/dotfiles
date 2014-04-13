# Configure shell options

# Automatically fix spelling errors in directory names for cd command
shopt -s cdspell

# List the status of any stopped and running jobs before exiting an
# interactive shell.
#
# If any jobs are running, this causes the exit to be deferred until a second
# exit is attempted without an intervening command.
shopt -s checkjobs

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Enable extended pattern matching
shopt -s extglob

# The pattern ** used in a pathname expansion context will match all files and
# zero or more directories and subdirectories. If the pattern is followed by a
# /, only directories and subdirectories match.
shopt -s globstar

# Append to the history file, don't overwrite it
shopt -s histappend

# The results of history substitution are not immediately passed to the shell
# parser. Instead, the resulting line is loaded into the readline editing
# buffer, allowing further modification.
shopt -s histverify
