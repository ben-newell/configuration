if status is-interactive
    # Commands to run in interactive sessions can go here

    # Homebrew
    set -gx PATH /opt/homebrew/bin $PATH

    atuin init fish | source

    fish_vi_key_bindings

    alias g='git'
    abbr -a g 'git'

    alias ls 'lsd --group-dirs first'  # --group-dirs first will list directories first
    alias ll 'lsd -l'  # -l is used to display in long format
    alias la 'lsd -la'  # -a will show all files including hidden files and directories
    alias lha 'lsd -lha'  # -h makes sizes human readable, adding 'a' shows hidden files too
    alias v 'exa --git --header --long'

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
end
