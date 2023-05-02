# Set options
ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/morpheus/.oh-my-zsh"
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh
setopt HIST_IGNORE_DUPS
unsetopt completealiases
DISABLE_AUTO_UPDATE="true"

# Set history options
HISTFILE=~/.zsh_history
HISTSIZE="1000"
SAVEHIST="1000000"

# Configure completion
zstyle ':completion:*' rehash true
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Set PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export GOPATH=$HOME/go
export LANG="en_US.UTF-8"

# Configure aliases
alias numFiles='echo $(ls -1 | wc -l)'
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'

# Custom functions
cdf () {
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

# Aliases
alias qfind="find . -name "
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --auto-open-devtools-for-tabs'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"
alias plistbuddy="/usr/libexec/PlistBuddy"
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias map="xargs -n1"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "${method}"="lwp-request -m '${method}'"
done
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias reload="exec ${SHELL} -l"
alias ls="exa --group-directories-first"
alias la="ls -la"
alias v="clear; exa -h -l -a --git --classify --group-directories-first --time-style long-iso --color automatic --icons"
alias le="/bin/ls -C --color=yes | less -R"
alias o="open"
alias t="tmux new-session \; \
  send-keys 'lnav' C-m \; \
  split-window -v \; \
  split-window -h \; \
  send-keys 'htop' C-m \;"
  
# Set PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=~/bin:$PATH
export PATH="/Users/morpheus/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Alias with functions
alias brownnoise='play -n synth brownnoise synth pinknoise mix synth sine amod 0.3 10'

function chpwd() {
  emulate -L zsh
  v
}

# Enable plugins
ZSH_AUTOSUGGEST_USE_ASYNC=true
source $ZSH/oh-my-zsh.sh
plugins=(sudo tmux history common-aliases systemd zsh-autosuggestions zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
