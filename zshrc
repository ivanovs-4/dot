# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

setopt noCORRECT

DISABLE_AUTO_UPDATE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/seiv/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN="✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ✭"

local fail_code='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%}
)'

local user='%{$fg[blue]%}%n%{$reset_color%}'
local monkey='%{$fg[red]%}@%{$reset_color%}'
local host='%{$fg[green]%}%m%{$reset_color%}'
local colo='%{$fg[grey]%}:%{$reset_color%}'
local pathwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'


function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo "%{$fg[yellow]%}$%{$reset_color%}"; fi
}

PROMPT="
${user}${monkey}${host}${colo}${pathwd}$(git_prompt_info)
%_$(prompt_char) "

# RPROMPT='${return_code}'
RPROMPT=''


export DEBFULLNAME="Sergey Ivanov"
export DEBEMAIL="seiv@yandex-team.ru"
alias dch='dch --distributor=debian'

if [ -z "$(ps -u $USER | grep gpg-agent)" ] ; then
  rm -rf "${HOME}/.gnupg/S.gpg-agent"
  gpg-agent --daemon --use-standard-socket --write-env-file "${HOME}/.gnupg/.gpg-agent-info" --default-cache-ttl 1800 > /dev/null
fi
if [ -f "${HOME}/.gnupg/.gpg-agent-info" ]; then
  . "${HOME}/.gnupg/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

export LC_ALL="en_US.UTF-8"
export LANG="ru"
export TERM="xterm-256color"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

