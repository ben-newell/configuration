# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set BLOCKSIZE
export BLOCKSIZE=1k

# History options
function clear_history { local HISTSIZE=0; }
HISTFILE=~/.zsh_history
HISTSIZE="1000"
SAVEHIST="1000000"

# Completion settings
zstyle ':completion:*' rehash true
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# PATH configuration
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LANG="en_US.UTF-8"

# Alias definitions
alias numFiles='echo $(ls -1 | wc -l)'
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'

# Search
alias qfind="find . -name "

# Chrome 
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --auto-open-devtools-for-tabs'
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# IP information
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias localip="ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print \$2}'"

# Legacy airport utility call
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Cleanup .DS_Store files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty trash
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Toggle visibility of all files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Toggle Desktop icon visibility
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL encode a string    
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]));"'

# PDF utilities
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# PlistBuddy
alias plistbuddy="/usr/libexec/PlistBuddy"

# Alias definition for mapping commands to input list
alias map="xargs -n1"

# Alias definitions for various HTTP methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "${method}"="lwp-request -m '${method}'"
done

# Alias definitions for volume controls
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Alias for AFK status
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Alias for reloading shell
alias reload="exec ${SHELL} -l"

# Use the LSD (ls Delux) package if it's installed
# Make sure to install it via `brew install lsd` command
#command -v lsd >/dev/null 2>&1 && alias ls="lsd"
#alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ls="eza"
# Other utility aliases
#alias v="clear; lsd -h -l -a --git --classify --group-directories-first --time-style long-iso --color automatic --icons"
#alias v='lsd --header --long --group-directories-first'
alias v='clear; eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions'
alias le="/bin/ls -C --color=yes | less -R"
alias o="open"
alias t="tmux new-session \; \
  send-keys 'lnav' C-m \; \
  split-window -v \; \
  split-window -h \; \
  send-keys 'htop' C-m \;"

# Here, I've corrected the alias qfind. It was missing an ending quote. 
# But remember, you will need to pass the name of the file as an argument when using this alias.
alias qfind="find . -name"

# The rest of the aliases are as before, no significant changes required.
# ...

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --auto-open-devtools-for-tabs'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"
alias plistbuddy="/usr/libexec/PlistBuddy"
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias map="xargs -n1"
alias pumpitup="osascript -e 'set volume output volume 100'"
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias reload="exec ${SHELL} -l"

alias c='clear'
alias vv="clear; lsd -h -l -a --classify --group-directories-first --timesort"
#alias le="/bin/ls -C --color=yes | less -R"
alias o="open"
alias brownnoise="play -n synth brownnoise synth pinknoise mix synth sine amod 0.3 10"
#alias l="ls -lF ${colorflag}"
alias l='lsd -lFh'
#alias la='lsd -lAFh'
alias la='eza -la --git'
alias lr='lsd -tRFh'
alias lt='lsd -ltFh'
alias ll='lsd -l'
alias ldot='lsd -ld .*'
alias lS='lsd -1FSsh'
alias lart='exa -1Fcart'
alias lrt='exa -1Fcrt'
alias lsr='lsd -lARFh'
alias lsn='lsd -1'

# Custom Functions
#
# Create an alias for 'g' as 'git'
alias g="git"

# File search using mdfind with display name or actual name

# Original

# spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# Second iteration

#spotlight () {
#  mdfind "(kMDItemDisplayName == '$@'wc) || (kMDItemFSName == '$@'wc)";
#}

spotlight () {
  mdfind "(kMDItemDisplayName == '$@'wc) || (kMDItemFSName == '$@'wc)" | while read -r file; do
    file_name=$(mdls -name kMDItemFSName -raw "$file")
    display_name=$(mdls -name kMDItemDisplayName -raw "$file")
    echo "File: $file_name"
    echo "Display Name: $display_name"
    echo "Path: $file"
    echo "---------------------"
  done
}

# Find process ID by name

findPid () {
  search=$(echo "$@" | awk '{print tolower($0)}')
  lsof | awk -v s="$search" 'tolower($1) ~ s {print "PID: " $2 "\nCommand: " $1 "\nPath: " $9 "\n---------------------"}';
}

alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias topForever='top -l 9999999 -s 10 -o cpu'

alias ttop="top -R -F -s 10 -o rsize"

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# Enable tab completion for 'g'
if (( $+functions[_git] )); then
  compdef g=git
fi

# Custom functions

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# This function allows you to easily switch back to the last visited directory
cdf() {
  currFolderPath=$( /usr/bin/osascript <<EOT
  tell application "Finder"
  try
    set currFolder to (folder of the front window as alias)
  on error
    set currFolder to (path to desktop folder as alias)
  end try
  POSIX path of currFolder
  end tell
EOT
)
  echo "cd to \"$currFolderPath\""
  cd "$currFolderPath"
}

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
function _ssh_hosts_completion {
  local -a ssh_hosts
  if [[ -e "$HOME/.ssh/config" ]]; then
    ssh_hosts=($(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n'))
    _describe 'SSH hosts' ssh_hosts
  fi
}

compdef _ssh_hosts_completion ssh sftp scp

# Add tab completion for `defaults read|write NSGlobalDomain`
function _defaults_completion {
  local -a global_domain
  global_domain=("NSGlobalDomain")
  if [[ $CURRENT -eq 3 && ($words[2] == "read" || $words[2] == "write") ]]; then
    _describe 'Global Domain' global_domain
  else
    _defaults
  fi
}

compdef _defaults_completion defaults

# Colored man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

# Add `killall` tab completion for common apps
function _killall_apps_completion {
  local -a common_apps
  common_apps=("Contacts" "Calendar" "Dock" "Finder" "Mail" "Safari" "iTunes" "News" "Music" "Podcasts" "TV" "SystemUIServer" "Terminal")
  _describe 'Common Apps' common_apps
}

compdef _killall_apps_completion killall

# Zip folder function
zipf () {
	zip -r "$1".zip "$1"
}


ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ;myip
  echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

# Set PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=~/bin:$PATH
export PATH="/Users/morpheus/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Alias with functions
alias brownnoise='play -n synth brownnoise synth pinknoise mix synth sine amod 0.3 10'

#function chpwd() {
#  emulate -L zsh
#  v
#}

# Enable plugins
plugins=(sudo tmux history common-aliases systemd zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

# Set options
#ZSH_THEME="agnoster"
#ZSH_THEME="eastwood"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="random"
#ZSH_THEME="agnoster"
ZSH_THEME="gozilla"
#ZSH_THEME="zenburn"


export LS_COLORS="$(vivid generate molokai)"
export ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_UPDATE="true"
setopt HIST_IGNORE_DUPS
unsetopt completealiases

alias b='brew'
alias d='cd "/Users/morpheus/Google Drive/My Drive/A"'
alias i='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

alias e='exit'
alias f='fish'

#eval "$(atuin init zsh)"
eval "$(fzf --zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

# ---- FZF and BAT -----
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_USE_ASYNC=true
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline" # default
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0,bg=cyan,bold,underline" # default
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)

bindkey '^ ' autosuggest-accept

alias z="zellij"


export TERM=xterm-256color
