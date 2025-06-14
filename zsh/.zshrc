# No last login message
# printf '\33c\e[3J'

# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format vcs_info variable
zstyle ':vcs_info:git:*' formats ' -> %F{green}%b%f'
zstyle ':vcs_info:*' check-for-changes true

# set up the prompt
setopt PROMPT_SUBST
PROMPT='[%# %F{cyan}%~%f${vcs_info_msg_0_}] $ '

# default is %n@%m %1~ %#
#export PROMPT="[$ %1~] %# "
# this is the one I usually use vvv
#export PROMPT="[%# %1~] $ "
#export PROMPT="[%1~] $ "
#export PROMPT="[%1~] %# "

alias v='nvim'
alias py='python3 '
alias gs='git status'
alias gc='git checkout'
alias gb='git checkout -b'
alias gr='./gradlew run'
alias tn='(){tmux new -s $1}'

alias activate='source .venv/bin/activate'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt nocaseglob

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# to hop by word or line with ctrl or alt and arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" end-of-line
bindkey "^[[1;3D" beginning-of-line

export NVM_LAZY_LOAD=true
source "$HOME/.zsh-nvm.zsh"
