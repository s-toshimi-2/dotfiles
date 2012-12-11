# Created by newuser for 4.3.10

#autoload
autoload -U colors
colors
autoload -U compinit
compinit
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt PUSHD_IGNORE_DUPS
setopt AUTO_PUSHD

export LS_COLORS='ln=35:di=34'

#zstyle
zstyle ':completion:*' menu select true
# directory = blue, symbolic link = magenta
zstyle ':completion:*' list-colors 'di=34;49' 'ln=35;49'

#standard prompt
PROMPT="%{${fg[cyan]}%}%n%{${fg[yellow]}%}-> %{${reset_color}%}"

#right prompt(display git branch)
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

#spell correction prompt
SPROMPT="%{${fg[red]}%}%r%{${reset_color}%} is correct? [n,y,a,e]: "

#mysql prompt
m_color0=$'\e[1;36m'
m_color1=$'\e[1;33m'
m_clear=$'\e[0m'
export MYSQL_PS1="$m_color0\d$m_color1> $m_clear"

# key bind (vim)
#bindkey -v

# key bind (emacs)
bindkey -e

# alias about ls
alias ls="ls -F --color"
alias sl="ls"
alias ll="ls -l"
alias la="ls -A"
alias lla="ls -l -A"
alias lr="ls -tr"

# alias about rm
alias rm="rm -i"

# alias about cp
alias cp="cp -i"

# alias about mv
alias mv="mv -i"

# alias about popd
alias pd="popd"

# alias about git
alias gitad="git add"
alias gitst="git status"
alias gitco="git commit"
alias gttcoa="git commit -a"

alias grep="grep --color"
