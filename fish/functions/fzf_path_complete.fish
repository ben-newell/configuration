function fzf_path_complete
    set token (commandline -t)
    if test -z "$token"
        return
    end

    set expanded (eval echo $token)
    if not test -d "$expanded"
        return
    end

    set choice (fd --hidden --no-ignore --exclude .git . "$expanded" | fzf)
    if test -z "$choice"
        return
    end

    commandline -t "$choice"
end

