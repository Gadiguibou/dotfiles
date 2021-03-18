# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gabriel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="minimal"
# ZSH_THEME="nicoulaj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
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
#COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
bgnotify
zsh-interactive-cd
history-substring-search
zsh-syntax-highlighting
zsh-autosuggestions
zsh-completions
sdk
cargo
themes
)

source $ZSH/oh-my-zsh.sh

# This reloads completions for zsh-completions
autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias cl=clear
alias v="$EDITOR"
alias f="$FILE"
alias e="$EDITOR"
alias untar="tar -zxvf"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias cs="alacritty-colorscheme"
alias gccs="gcc-10 -Wall -Wextra -Wpedantic -Werror -O2 -std=c99 -fanalyzer" \
	# -D_FORTIFY_SOURCE=2 -fasynchronous-unwind-tables -fexceptions -fpic \
	# -shared -fstack-clash-protection -g -pipe "
alias ls='exa'
alias la='exa -la'
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -v"
alias mkd="mkdir -pv"
alias g="git"
alias sdn="sudo shutdown -h now"
alias df='df -h'
alias du='du -ch'
alias ipp='curl ipinfo.io/ip'
alias sudo='sudo '
alias exdir="cd $(exercism workspace)"
alias rstpd="/home/gabriel/.local/bin/rstpd.sh"
alias sysbackup="sudo /home/gabriel/.local/bin/borg-system-backup.sh"
alias ls-man-installed="/home/gabriel/.local/bin/list-manually-installed.sh"
alias update="sudo apt update && sudo apt upgrade; flatpak update"
alias clippystrict="cargo clippy \
  --all-targets \
  --all-features \
  -- \
  --deny clippy::all \
  --deny warnings \
  --deny clippy::pedantic \
  --deny clippy::cargo \
  --deny clippy::nursery"
alias rstfmtchk="cargo fmt --all -- --check"

play() {
    mpv --fs "$1" & disown
}

rustnew() {
  cargo new $1 $2 && cd ./$1 && code .
}

exnew() {
  exercism download --track=$1 --exercise=$2 && cd /home/gabriel/snap/exercism/5/exercism/$1/$2 && code .
}

COLOR_DIR="$HOME/.config/alacritty/colors/"
LIGHT_COLOR='base16-github-256.yml'
DARK_COLOR='snazzy.yaml'

alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V"
alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V" 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# This loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# This changes the highlight color of zsh-autosuggest so it is visible when using different color schemes
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/gabriel/.sdkman"
[[ -s "/home/gabriel/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gabriel/.sdkman/bin/sdkman-init.sh"

# This loads starship
# eval "$(starship init zsh)"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

fpath+=${ZDOTDIR:-~}/.zsh_functions
