if status is-interactive
    atuin init fish | source

    function dl; cd ~/Downloads; end
    function dt; cd ~/Desktop; end
    function o; open $argv; end
    function e; exit; end
    function f; open -a Finder .; end

    alias c='clear'
    alias g='git'
    alias i 'cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
    alias b 'cd ~/Library/Mobile\ Documents/iCloud~md~obsidian'
   
    alias v 'exa --header --long --group-directories-first --git --color=always'
    alias vv="clear; exa -h -l -a --classify --group-directories-first --time-style long-iso --color automatic --icons"
    
    function l; lsd -lFh; end
    function la; lsd -lAFh; end
    function lr; lsd -tRFh; end
    function lt; lsd -ltFh; end
    function ll; lsd -l; end
    
    function ldot; lsd -ld .*; end
    function lS; lsd -1FSsh; end
    function lsr; lsd -lARFh; end
    function lsn; lsd -1; end

    function lart; exa -1Fart; end
    function lrt; exa -1Frt; end

    alias ls 'lsd --group-dirs first'  # --group-dirs first will list directories first

    set -x PATH ~/bin $PATH
    set -x PATH /usr/local/bin $PATH
    set -x PATH /opt/homebrew/sbin $PATH
    set -x PATH /opt/homebrew/bin $PATH

    fish_vi_key_bindings

    alias cp 'cp -i'
    alias mv 'mv -i'

    set -U fish_color_match red
    set -U fish_color_search_match green
    set -U fish_color_completion green
    set -U fish_color_command cyan
    set -U fish_color_param red

    # Change dir after making dir
    function mcd; mkdir -p $argv cd $argv; end

end
