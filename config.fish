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
    alias v 'lsd -la'  # Same as 'la', showing all files including hidden
    function o
        open $argv
    end

    complete -c o -a "(command ls)"
    alias c='clear'

    set -Ua fish_user_paths /opt/homebrew/sbin $fish_user_paths

end

