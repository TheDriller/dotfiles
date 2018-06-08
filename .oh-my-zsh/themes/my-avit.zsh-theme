#!/usr/bin/env zsh

# AVIT ZSH Theme

# prompt characters
# ❯ ➜ 
setopt PROMPT_SUBST
PROMPT='%F{blue}┌───%f$(_user_host) ${_current_dir} ${_return_status} $(git_prompt_info)
%F{blue}└─►%f%F{red} '

PROMPT2='%(?.%F{blue}.%F{red})◀%{$reset_color%} '

RPROMPT='%{$(echotc UP 1)%} $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'

local _current_dir="$FX[bold]%{$fg_bold[blue]%}%2~%{$reset_color%} "
local _return_status="$FX[bold]%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"
local _hist_no="$FX[bold]%{$fg[grey]%}%h%{$reset_color%}"

# Use to replace path / with another character (ex: ►)
function _current_dir_arrow() {
	echo "$FX[bold]%{$fg_bold[blue]%}$(pwd | sed 's_/home/david_~_' | sed 's/\//'$fg_bold[blue]' ► '$fg_bold[blue]'/g')"
}

function _current_dir() {
  local _max_pwd_length="65"
  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "%{$fg_bold[blue]%}%-2~ ... %3~%{$reset_color%}"
  else
    echo "%{$fg_bold[blue]%}%~%{$reset_color%} oh"
  fi
}

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="white"
fi

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FX[bold]$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FX[bold]$reset_color%}"

# characters
# 
# defaults (in order)
# ✗ ✔ ✚ ⚑ ✖ ▴ § ◒
# cool: ★ ✎ ⚠
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}$FX[bold]✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}❤%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✎ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}$FX[bold]? " 

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'
