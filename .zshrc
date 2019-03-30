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
SPACESHIP_RUBY_SYMBOL='ruby '
SPACESHIP_PROMPT_ADD_NEWLINE=false

#. /home/domi/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  extract
  rails
  vi-mode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=yellow,bold

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
#
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word


alias l='ls -lh --color=auto'
alias ls='ls -lh --color=auto'
alias lsh='ls -alh --color=auto'
alias i3config='vim ~/.config/i3/config'
alias cleartmp='sudo rm -r /tmp/*'
alias cpf='xsel -b <'
alias ping='ping www.google.com'
alias install='sudo apt install'
alias us='setxkbmap us'
alias hu='setxkbmap hu'
alias r='rails'
alias g='git'
alias virpay='cd ~/shinrai/virpay-bot'
alias homepage='gvim ~/Documents/homepage'
alias mrcoin='~/shinrai/mrcoin'
alias v='viewnior'
alias findp='apt-file search'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

#extract () {
    #if [ -f $1 ] ; then
        #case $1 in
            #*.tar.bz2)   tar xjf $1     ;;
            #*.tar.gz)    tar xzf $1     ;;
            #*.bz2)       bunzip2 $1     ;;
            #*.rar)       unrar e $1     ;;
            #*.gz)        gunzip $1      ;;
            #*.tar)       tar xf $1      ;;
            #*.tbz2)      tar xjf $1     ;;
            #*.tgz)       tar xzf $1     ;;
            #*.zip)       unzip $1 $1/   ;;
            #*.Z)         uncompress $1  ;;
            #*.7z)        7z x $1        ;;
            #*)     echo "'$1' cannot be extracted via extract()" ;;
        #esac
    #else
        #echo "'$1' is not a valid file"
    #fi
#}

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/vault vault

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# auto ls after cd
function chpwd() {
    emulate -L zsh
    ls
}
