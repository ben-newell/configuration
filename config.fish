if status is-interactive

  # PATH
  fish_add_path ~/.config/fish/functions/
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
  # Set the default cursor shape for Fish (Emacs mode)
  set -g fish_cursor_default block

  # If you use vi-mode key bindings (e.g., `fish_vi_key_bindings`)
  # Set the cursor shape for insert mode
  set -g fish_cursor_insert block
  # Set the cursor shape for normal mode (often defaults to block anyway, but good to be explicit)
  set -g fish_cursor_normal block
  # Set the cursor shape for replace mode (if you use it)
  set -g fish_cursor_replace_one block
  set -g fish_cursor_replace block
  # Set the cursor shape for visual mode (if you use it)
  set -g fish_cursor_visual block

  # Does this work?
  fish_vi_key_bindings

  # Load Functions folder
  set fish_function_path \
    ~/.config/fish/functions/*/ \
    $fish_function_path

  # atuin
  # atuin init fish --disable-ctrl-r | source

  # The Fuck
  thefuck --alias | source

  # FZF
  fzf --fish | source
  set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
  function cdf
    set dir (fzf-cd-widget)
    if test -n "$dir"
        cd $dir
    end
  end

  # don't think this works yet
  set -Ux HIST_IGNORE "ls|cd|pwd|v|vv|"

  # Set ls colors, does this work?
  set -x LS_COLORS (vivid generate molokai)

  # 1password cli login
  alias ops='eval $(op signin)'

  # aliases
  alias c='clear'
  #alias a='atuin history list --cmd-only | fzf'
  alias g='git'
  alias i="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
  alias b="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ObsidianVault"
  alias le="/bin/ls -C --color=yes | less -R"
  alias lg='eza -l --color=auto --group-directories-first --git-ignore --git'  # List respecting .gitignore
  alias fe='fend'
  alias ll='eza -l --color=auto --group-directories-first'
  alias la='eza -la --color=auto --group-directories-first --git'
  alias lt='eza -T --color=auto --group-directories-first'  # Tree view
  alias l='eza -d .* --color=auto'  # Show only dotfiles
  alias cp='cp -i'
  alias mv='mv -i'
  alias ls="eza"
  alias v='eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions'
  alias vv='eza -lha --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions'
  alias cleardns='sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder'
  alias cpwd="pwd | pbcopy"
  alias ql='qlmanage -p'
  alias install-uv='pip install uv && uv pip install --upgrade pip'
  alias z='zellij'

  function dl; cd ~/Downloads; end
  function dt; cd ~/Desktop; end
  function o; open $argv; end
  function e; exit; end
  function f; open -a Finder .; end
  function t; touch (date -I)-$argv; end
  function l; lsd -lFh; end
  function lr; lsd -tRFh; end
  function ldot; lsd -ld .*; end
  function lS; lsd -1FSsh; end
  function lsr; lsd -lARFh; end
  function lsn; lsd -1; end
  function bs $argv; brew search $argv; end

  # reload the shell
  function reload; exec fish; end

  # Change dir after making dir
  function mcd; mkdir -p $argv cd $argv; end

  # FZF history search 
  function fh; eval (history --search | fzf +s --tac | sed 's/ [0-9] *//'); end;

  # FZF process search
  function fproc; ps aux | fzf --preview 'echo {}' --preview-window right:65% | awk '{print $2}' | xargs kill -9; end;

  # Search chrome history
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

  # Colored man pages
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

  # Another reload function
  function reload_all_fish
      for pane_id in (tmux list-panes -s -F '#{pane_id}')
          echo "Reloading Fish in pane: $pane_id"
          tmux send-keys -t $pane_id 'exec fish' C-m
      end
  end

  # Git commit all-in-one command
  function gcp
      read -l -P "Enter commit message: " msg
      git add . && git commit -m "$msg" && git push
  end

  export NVM_DIR='$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")'

  function killfzf_root
    set pid (ps -ef | sed 1d | fzf --height 40% --reverse --preview 'ps -fp {1}' | awk '{print $2}')
    if test -n "$pid"
        sudo kill -9 $pid
    end
  end

  function killfzf
    set pid (ps -ef | sed 1d | fzf --height 40% --reverse --preview 'ps -fp {2}' | awk '{print $2}')
    if test -n "$pid"
        if ps -o user= -p $pid | grep -q root
            echo "Root-owned process detected. Using sudo..."
            sudo kill -9 $pid
        else
            kill -9 $pid
        end
    end
  end
  
  # Set DISPLAY for X11 forwarding if XQuartz is available
  if test -z "$DISPLAY"; and test "$TERM_PROGRAM" = "tmux"
      set -gx DISPLAY :0
  end

end
