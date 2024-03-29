# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sal/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="clean"

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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-navigation-tools colored-man-pages 
         zsh-interactive-cd zsh-autosuggestions sudo taskwarrior)

source $ZSH/oh-my-zsh.sh

zle -N znt-cd-widget
bindkey "^E" znt-cd-widget
zle -N znt-kill-widget
bindkey "^X" znt-kill-widget

znt_cd_hotlist=( "~" "~/workspace" "~/.vim_runtime" 
                 "~/Downloads" "~/sftp" "~/workspace/Schism"
                 "~/Documents" "~/Pictures" )

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
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
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cls="clear"
alias q="exit"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias copy="xclip"
alias paste="xclip -o"
alias find-duplicate-files="find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate"
alias common-commands="history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head"
alias heavy-procs="ps aux | sort -nk +4 | tail"
alias host-file="ncat -v -l 8080 <"
alias mingw="/usr/bin/x86_64-w64-mingw32-g++-win32"
alias CAPSOFF="xdotool key Caps_Lock"
alias aptsrch="apt search"
alias aptupd="sudo apt -y update && sudo apt -y upgrade"
alias aptinst="sudo apt -y install"
alias findproc="ps aux | grep -i"
alias find-files-with="find . -type f -print | xargs grep"

# Things I want to find a use for:
# Outputting audio:
#   dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
# In-console clock
#   while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
# Delete all files except those matching wildcard
#   rm !(*.ogg|*.wav|*.mp3)
# Real time internet activity
#   lsof -i
# Remove duplicate entries in a file
#   awk '!x[$0]++' <file>
# Find duplicate files
#   find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate
# Extract tar without saving locally
#   wget -qO - "http://www.tarball.com/tarball.gz" | tar zxvf -
# Graphical subdirectory tree, without an install
#   ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'

# rm-except() { TODO
#     local FILES="${1}"

#     for FILE in $@
#     do
# 	    FILES+="|${FILE}"
#     done
#     echo "$FILES"
#     rm -f !($FILES)
# }

mkcd() {
    mkdir $1 && cd $_
}

rawurlencode() {
  local string="${@}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

ddg() { 
    local string=$(rawurlencode $@)
    links2 "https://duckduckgo.com/html?q=$string"
}

isitup() { 
    curl -s "https://isitup.org/$1" | grep "<title>" | cut -c 8- | rev | cut -c 9- | rev 
}

fortune /usr/share/games/fortunes /usr/share/games/fortunes/off /usr/share/games/fortunes/ru | lolcat
