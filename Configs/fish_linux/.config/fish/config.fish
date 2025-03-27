if status is-interactive
    # Commands to run in interactive sessions can go here
end

# source ~/.asdf/asdf.fish
function starship_transient_prompt_func
    starship module time
end
starship init fish | source
enable_transience
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fzf --fish | source
zoxide init fish | source

set -gx EDITOR nvim
set -gx DELTA_FEATURES +side-by-side

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

abbr -a ls lsd -Al --tree --depth 1
abbr -a ls-al lsd -Al --ignore-config
abbr -a cd z
abbr -a .. up
