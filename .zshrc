# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/domi/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="mortalscumbag"
# ZSH_THEME="nanotech"
# ZSH_THEME="ys"
# ZSH_THEME="zhann"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="gallois"
# ZSH_THEME="oxide"
ZSH_THEME="spaceship"

SPACESHIP_TIME_SHOW=true
# SPACESHIP_RUBY_SYMBOL='ruby '
SPACESHIP_PROMPT_ADD_NEWLINE=false

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# only load nvm if needed
# export NVM_LAZY_LOAD=true
# export NVM_COMPLETION=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  extract
  rails
  zsh-vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=yellow,bold

ZSH_AUTOSUGGEST_USE_ASYNC=true

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/domi/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
setopt appendhistory autocd
unsetopt beep

bindkey -v
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# home - end keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# import aliases
source ~/.aliases

# export PATH="/home/domi/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

load-nvm(){
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

load-docker(){
  sudo systemctl start docker.service
  sudo systemctl start containerd.service
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/vault vault

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# auto ls after cd
function chpwd() {
    emulate -L zsh
    if [[ "$PWD" == "$HOME/Downloads" ]]; then
      ls -tr
    else
      ls
    fi
}

# wait 10ms instead of 40 when pressing escape to switch to normal mode
export KEYTIMEOUT=1
export XDG_CURRENT_DESKTOP=i3
# export TERM=xterm-256color

function o(){
  xdg-open $1 &; disown
}

# zprof
