if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

export C_INCLUDE_PATH="/opt/local/include"
export CPLUS_INCLUDE_PATH="/opt/local/include"
export LIBRARY_PATH="/opt/local/lib"

# OverWrite Shell from '/bin/bash' to '/bin/zsh'
export SHELL="/bin/zsh"
#export LS_COLORS="ex=01;32"
#export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='ln=35:di=34'
#export GREP_COLOR="1;33"
