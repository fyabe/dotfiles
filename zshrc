# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# General
setopt correct
setopt auto_cd
setopt auto_pushd
setopt magic_equal_subst

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types

# prompt
autoload -U colors; colors
PROMPT='[${USER}@${HOST}] %(!.#.$) '
RPROMPT='[%~]'
setopt transient_rprompt
setopt prompt_subst

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# for Gnu source-highlight
export LESS='-R'
export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'

alias ls="ls -F --color"

# proxy
export http_proxy=http://10.255.254.11:8080
export https_proxy=http://10.255.254.11:8080
export no_proxy=172.16.0.48

# for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias
alias vless="/usr/share/vim/vim74/macros/less.sh"

#for git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
