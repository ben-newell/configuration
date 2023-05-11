if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Homebrew
    set -gx PATH /opt/homebrew/bin $PATH

    atuin init fish | source

    fish_vi_key_bindings

    alias g='git'
    abbr -a g 'git'

    alias ll 'exa -l --color=always --icons --group-directories-first --header'
    alias la 'exa -a --color=always --icons --group-directories-first --header'
    alias lha 'exa -lha --color=always --icons --group-directories-first --header --git'
    alias v 'exa -alh --color=always --icons --group-directories-first --header --git --extended'
    function o
        open $argv
    end

    complete -c o -a "(command ls)"

end

