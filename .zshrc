export VISUAL=nvim;
export EDITOR=nvim;

emulate sh
. ~/.profile
emulate zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

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

# Plugin[zsh-vim-mode]
MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    autojump
    fzf-tab
    zsh-autosuggestions
    fzf
    zsh-vim-mode
    # MUST BE LAST
    zsh-syntax-highlighting 
)

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# Add alias to nvim with vim, we can still use vim with /vim command

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use dircolors settings for the LS_COLORS env variable so it works for alacritty
eval "$(TERM=xterm-256color dircolors -b ~/.dircolors)"
export USER_LS_COLORS="$LS_COLORS"

# Fix cursor when in vim mode
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)


# Alacritty theme setup with vim support
COLOR_DIR="$HOME/.eendroroy-alacritty-theme/themes"
LIGHT_COLOR='onedark.yaml'
DARK_COLOR='onedark.yaml'

alias day="alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V"
alias night="alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V"

# Add .local/bin folder to PATH
export PATH="$HOME/.local/bin:$PATH"
# Add go binaries to PATH
export PATH="$HOME/go/bin:$PATH"
# Add zsh scripts in ~/.zsh/scripts to PATH
export PATH="$HOME/.zsh/scripts:$PATH"


### Plugin[fzf] config
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
eval "$(pmy init)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lapin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lapin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lapin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lapin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}


export PYTHONPATH="/home/lapin/Documents/GitHub/robotic/vision/src:/home/lapin/Documents/GitHub/robotic/models:/home/lapin/Documents/GitHub/robotic/models/research"

export PYTHONPATH="${PYTHONPATH}:/home/lapin/Projects/ai/pixai/src"
# export PYTHONPATH="/home/lapin/Documents/GitHub/robotic/vision/src"
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

wacId=$(xsetwacom list devices | grep STYLUS | tr " \t" ":" | tr -s ":" | cut -d ":" -f 6)
alias wacDVI="xsetwacom set $wacId MapToOutput HEAD-1"
alias wacHDMI="xsetwacom set $wacId MapToOutput HEAD-0"
wacHDMI

# conda activate python36
source ~/Projects/Unity-Robotics-Hub/tutorials/pick_and_place/ROS/devel/setup.zsh

# ROS config
# source /opt/ros/noetic/setup.zsh
source ~/catkin_ws/devel/setup.zsh
# source ~/ros/ws_moveit/devel/setup.zsh

#vcs completion
source /usr/share/vcstool-completion/vcs.zsh

alias reloadDrives=" sudo echo '- - -' | sudo tee /sys/class/scsi_host/host*/scan"

