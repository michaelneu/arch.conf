#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# load bash completition if available
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

BORDER_PIPE_1='\342\224\214'
BORDER_PIPE_2='\342\224\200'
BORDER_PIPE_3='\342\224\224'

# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
COLOR_NAME='\[\033[0;32m\]'
COLOR_AT='\[\033[0;37m\]'
COLOR_HOST='\[\033[1;30m\]'
COLOR_CWD=$COLOR_NAME
COLOR_RESET='\[\033[0m\]'

export PS1="$COLOR_AT$BORDER_PIPE_1$BORDER_PIPE_2[ $COLOR_CWD\w $COLOR_AT]$COLOR_AT \n$COLOR_AT$BORDER_PIPE_3$BORDER_PIPE_2$COLOR_RESET \$ "
export HISTCONTROL=ignorespace

export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

source $HOME/.bash_aliases
