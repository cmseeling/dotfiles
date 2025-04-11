function ls-p
    if test -f .gitignore
        while read -l line
            if test -n "$line" && not string match -q "#*" -- "$line"
                # wrap wildcard lines in quotes
                if string match -q "*\**" -- "$line"
                    set line \"$line\"
                end
                set -a gitignore_patterns "$line"
            end
        end <.gitignore

        set args --group-directories-first --tree
        for pattern in $gitignore_patterns
            set args $args -I $pattern
        end

        lsd $args
        # echo $ignoreArgs
    else
        lsd --tree
    end
end
