source /Users/Soh/perl5/perlbrew/etc/bashrc

[[  -s "/Users/yukke/.rvm/scripts/rvm" ]] && source "/Users/yukke/.rvm/scripts/rvm"
# Load RVM into a shell session *as a function*


# Keybiand emacs
bindkey -e

# pager
export LESS='--LONG-PROMPT'
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#keep background processes at full speed
setopt NOBGNICE

# Core size
limit coredumpsize 0

# restart running processes on exit
setopt HUP

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
LISTMAX=0
autoload -U colors

## History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt extended_history #add time 
setopt inc_append_history
setopt hist_verify
setopt share_history
setopt hist_ignore_dups
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

## Prompt
setopt prompt_subst
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'

#PROMPT="%Ulocal@%m >> %u"
#PROMPT="%U"${GREEN}${USER}"@local>> %u"
#PROMPT="%U"$GREEN'${USER}@local>> ' 
PROMPT="yukke.local>> "
RPROMPT="${DEFAULT}[%/]"

## comletion
setopt magic_equal_subst
setopt auto_list
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors di=34 fi=0
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt list_packed
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache yes

## job
setopt long_list_jobs

## logout
setopt ignore_eof
unset autologout

## alias
alias ls='ls -tF -G'
alias grep='grep --color'
alias c='clear'
alias history='history 1'
alias ta="tmux attach"
alias tw='tmux list-windows'
alias screen='$HOME/bin/screen/src/screen'
alias lf='ls -FA'
alias emacs='emacs -nw'
alias mv='mv -i'
alias screenkill="ps ax | grep SCREEN | awk '{print $1}' | xargs kill"
alias sl='ls'
alias ks='ls'
alias cd..='cd ..'
alias kess='less'
alias lc='lv'
alias desk='cd $HOME/Desktop'
alias ll='ls -l -F'

## cd
setopt auto_cd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt auto_pushd
setopt pushd_ignore_dups

# autojump
alias j="autojump"
#[[ -f ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

## initialize
autoload -U compinit
compinit -u

export PATH=$HOME/bin:$PATH


## perlbrew
if [  -f $HOME/.perlbrew/etc/bashrc ]; then
  source $HOME/.perlbrew/etc/bashrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
