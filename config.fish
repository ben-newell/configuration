if status is-interactive
    atuin init fish --disable-ctrl-r | source
    thefuck --alias | source
    
    fzf --fish | source
    set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
    
    set -Ux HIST_IGNORE "ls|cd|pwd|v|vv|"

    alias c='clear'
    alias a='atuin history list --cmd-only | fzf'
    alias g='git'
    alias i 'cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
    alias b 'cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ObsidianVault'
    alias le="/bin/ls -C --color=yes | less -R"
    alias lg='eza -l --color=auto --group-directories-first --git-ignore --git'  # List respecting .gitignore
    alias fe='fend'
    alias v='lsd --header --long --group-directories-first --color=auto'
    alias v='eza -olh --icons'
    alias vv='clear; lsd -h -l -a --classify --group-directories-first --timesort --color=auto --icon=auto'
    alias ll='eza -l --color=auto --group-directories-first'
    alias la='eza -la --color=auto --group-directories-first'
    alias lt='eza -T --color=auto --group-directories-first'  # Tree view
    alias l.='eza -d .* --color=auto'  # Show only dotfiles
    alias cp 'cp -i'
    alias mv 'mv -i'
    alias ls 'eza --icons'
    alias cleardns='sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder'

    function dl; cd ~/Downloads; end
    function dt; cd ~/Desktop; end
    function o; open $argv; end
    function e; exit; end
    function f; open -a Finder .; end
    function t; touch $(date -I)-$argv; end 
    function l; lsd -lFh; end
    function lr; lsd -tRFh; end
    function ldot; lsd -ld .*; end
    function lS; lsd -1FSsh; end
    function lsr; lsd -lARFh; end
    function lsn; lsd -1; end

    set -x PATH ~/bin $PATH
    set -x PATH /usr/local/bin $PATH
    set -x PATH /opt/homebrew/sbin $PATH
    set -x PATH /opt/homebrew/bin $PATH
    set -Ux PATH /opt/homebrew/opt/qt@5/bin $PATH
    set -U fish_color_match red
    set -U fish_color_search_match green
    set -U fish_color_completion green
    set -U fish_color_command cyan
    set -U fish_color_param red

    fish_vi_key_bindings

    set -x LS_COLORS (vivid generate molokai)

    function reload; exec fish; end

    # Change dir after making dir
    function mcd; mkdir -p $argv cd $argv; end

    function fh; eval (history --search | fzf +s --tac | sed 's/ [0-9] *//'); end;
    
    function fproc; ps aux | fzf --preview 'echo {}' --preview-window right:65% | awk '{print $2}' | xargs kill -9; end;
    
    function ch
        set cols (math $COLUMNS / 3)
        set sep '{::}'                  

        cp ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

        sqlite3 -separator $sep /tmp/h \
            "select substr(title, 1, $cols), url
            from urls order by last_visit_time desc" |
            awk -F $sep '{printf "%-'$cols's \x1b[36m%s\x1b[m\n", $1, $2}' |
            fzf --ansi --multi | 
            sed 's#.*\(https*://\)#\1#' |
            xargs -o open   # Use -o to explicitly open URLs
    end

    function man
    env \
        LESS_TERMCAP_mb=(printf "\e[1;31m") \
        LESS_TERMCAP_md=(printf "\e[1;31m") \
        LESS_TERMCAP_me=(printf "\e[0m") \
        LESS_TERMCAP_se=(printf "\e[0m") \
        LESS_TERMCAP_so=(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=(printf "\e[0m") \
        LESS_TERMCAP_us=(printf "\e[1;32m") \
            man "$argv"
    end

end