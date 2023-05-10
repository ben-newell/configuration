if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Homebrew
    set -gx PATH /opt/homebrew/bin $PATH

    atuin init fish | source

    fish_vi_key_bindings

    alias g='git'
    abbr -U g 'git'

end

