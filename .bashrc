## Setting git "ornaments"
. $HOME/.local/etc/git-completion.bash
. $HOME/.local/etc/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
#export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWUPSTREAM="auto"
#export GIT_PS1_DESCRIBE_STYLE="branch"
export PROMPT_COMMAND='__git_ps1 "\[$(tput smul)\]\h\[$(tput rmul)\]:\[$(tput bold)\]\w\[$(tput sgr0)\]" "| " " (%s"'

# Less fonfiguration 
#export LANG=en_US.ISO8859-1
export LANG=en_US.utf8
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '


# Append to the history file, don't overwrite it
shopt -s histappend
# Setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000000
HISTFILESIZE=$HISTSIZE
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Export terminal so that the option set mouse=a in vim works
export TERM=xterm-256color

# Load bash_aliases 
source ~/.bash_aliases
