if status is-interactive
    # Commands to run in interactive sessions can go here

    # Homebrew
    set -gx PATH /opt/homebrew/bin $PATH

    atuin init fish | source

    fish_vi_key_bindings

    alias g='git'
    abbr -a g 'git'

    alias ls 'lsd --group-dirs first'  # --group-dirs first will list directories first
    alias lha 'lsd -lha'  # -h makes sizes human readable, adding 'a' shows hidden files too
    #alias vv 'exa --git --header --long --group-directories-first'
    #alias le '/bin/ls -lhG | less -R'
    alias le 'exa -lh --group-directories-first --git --color=always | less -R'
    alias cp="cp -i"
    alias mv="mv -i"
    alias d 'cd "/Users/morpheus/Google Drive/My Drive/A"'
    alias i 'cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
    alias vv 'ls -lha' 
    #alias v 'exa --git --header --long --group-directories-first'
    alias b 'cd ~/Library/Mobile\ Documents/iCloud~md~obsidian'
    alias v 'exa --header --long --group-directories-first' # remove --git
		function l; lsd -lFh; end
		function la; lsd -lAFh; end
		function lr; lsd -tRFh; end
		function lt; lsd -ltFh; end
		function ll; lsd -l; end
		function ldot; lsd -ld .*; end
		function lS; lsd -1FSsh; end
		function lart; exa -1Fcart; end
		function lrt; exa -1Fcrt; end
		function lsr; lsd -lARFh; end
		function lsn; lsd -1; end





    function o
        open $argv
    end

    complete -c o -a "(command ls)"
    alias c='clear'

    set -Ua fish_user_paths /opt/homebrew/sbin $fish_user_paths

    # Set PATH
    set -x PATH $HOME/.rbenv/bin $PATH
    set -x PATH ~/bin $PATH
    set -x PATH /Users/morpheus/.cargo/bin $PATH
    set -x PATH /usr/local/bin $PATH
    set -x PATH /opt/homebrew/sbin $PATH
    set -x PATH /opt/homebrew/bin $PATH
    
    # Change dir after making dir
    function mcd
        mkdir -p $argv
        cd $argv
    end

    function f
        open -a Finder .
    end

    function fish_user_key_bindings
        bind \t complete-and-search
    end

    function dl
        cd ~/Downloads
    end

    function dt
        cd ~/Desktop
    end

    set -U fish_color_match red
    set -U fish_color_search_match green
    set -U fish_color_completion green
    set -U fish_color_command cyan
    set -U fish_color_param red

end
