if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
starship init fish | source
enable_transience
# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fzf --fish | source
zoxide init fish | source

set -gx EDITOR nvim
set -gx DELTA_FEATURES +side-by-side
fish_add_path $HOME/.local/bin

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
