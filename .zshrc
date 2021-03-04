[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# This is a workaround for having a system node and NVM node
#PATH="/usr/local/bin:$(getconf PATH)"

# Path to your oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# How often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  osx
  chucknorris # ¯\_(ツ)_/¯
<<<<<<< HEAD
  vi-mode
=======
  zsh-vim-mode
>>>>>>> 03e1fd8 (pyenv)
  fzf
)

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Load aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases ] && source ~/.aliases

# vi mode
bindkey -v
# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# reduce delay from 0.4 to 0.1 seconds when typing <ESC>
export KEYTIMEOUT=1

export ANDROID_SDK=/Users/adelakloul/Library/Android/sdk
export PATH=$ANDROID_SDK/platform-tools:$PATH

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")
EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}
#PS1="$EMOJI >"

# fortune | cowsay -f tux

export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add cargo to the PATH
#source $HOME/.cargo/env

# Use nvim as the default editor
export EDITOR=nvim

#fortune | cowsay

#ctags -R --exclude=.git --exclude=log * &

# To use run: alaOpacity 0.8
function alaOpacity() {
    cat ~/.config/alacritty/alacritty.yml | jsin --yaml --yamlout --whole "(l.background_opacity=Number(\"$1\")) && l; " > /tmp/alacritty.yml.tmp
    mv /tmp/alacritty.yml.tmp $HOME/.config/alacritty/alacritty.yml
}

# To use run: alaFontSize 12
function alaFontSize() {
    cat ~/.config/alacritty/alacritty.yml | jsin --yaml --yamlout --whole "(l.font.size=Number(\"$1\")) && l; " > /tmp/alacritty.yml.tmp
    mv /tmp/alacritty.yml.tmp $HOME/.config/alacritty/alacritty.yml
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/usr/local/sbin:$PATH"
