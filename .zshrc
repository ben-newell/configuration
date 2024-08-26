# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set BLOCKSIZE
export BLOCKSIZE=1k

# History options
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
command -v lsd >/dev/null 2>&1 && alias ls="lsd"

# Other utility aliases
#alias v="clear; lsd -h -l -a --git --classify --group-directories-first --time-style long-iso --color automatic --icons"
alias v='lsd --header --long --group-directories-first'
alias le="/bin/ls -C --color=yes | less -R"
alias o="open"
alias t="tmux new-session \; \
  send-keys 'lnav' C-m \; \
  split-window -v \; \
  split-window -h \; \
  send-keys 'htop' C-m \;"

#OLD 

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
alias le="/bin/ls -C --color=yes | less -R"
alias o="open"
alias brownnoise="play -n synth brownnoise synth pinknoise mix synth sine amod 0.3 10"
#alias l="ls -lF ${colorflag}"
alias l='lsd -lFh'
alias la='lsd -lAFh'
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
source ~/.oh-my-zsh/oh-my-zsh.sh
plugins=(sudo tmux history common-aliases systemd zsh-autosuggestions zsh-syntax-highlighting history-substring-search)

# Set options
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
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

eval "$(atuin init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.pyenvrc
