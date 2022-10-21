# Configure shell history

# The number of commands to remember in the command history
HISTSIZE=10000

# The maximum number of lines contained in the history file
HISTFILESIZE=10000

# Do not write the following commands to the history
HISTIGNORE="cd"

# Do not add duplicated commands and commands starting from space to the
# history
HISTCONTROL="ignoredups:ignorespace"

# Write history every time bash shows the prompt
if ! echo -nE "$PROMPT_COMMAND" | grep -qE '\bhistory -a'; then
    PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
fi
