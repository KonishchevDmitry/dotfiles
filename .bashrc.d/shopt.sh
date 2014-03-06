# Configure shell options

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# Enable extended pattern matching
shopt -s extglob

# Patterns which match no files expands to a null string, rather than
# themselves.
#
# Sadly, doesn't work well on all distros in interactive mode. :(
#shopt -s nullglob

# Append to the history file, don't overwrite it
shopt -s histappend

# Automatically fix spelling errors in directory names for cd command
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
