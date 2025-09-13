if status is-interactive
    # Commands to run in interactive sessions can go here
end

## Run fastfetch as welcome message
function fish_greeting
    fastfetch
end

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Starship Prompt
function starship_transient_prompt_func
    starship module time
end
starship init fish | source
enable_transience

fzf --fish | source
zoxide init fish | source

set -gx EDITOR hx
set -gx DELTA_FEATURES +side-by-side

# homebrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# uv
fish_add_path "/home/chris/.local/bin"

# yazi shortcut
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# directory aliases
abbr -a ls lsd -Al --tree --depth 1
abbr -a ls-al lsd -Al --ignore-config
abbr -a cd z
abbr -a .. up

# abbr -a hx helix

# Common use taken from CachyOS Fish default config
abbr -a grubup "sudo grub-mkconfig -o /boot/grub/grub.cfg"
abbr -a fixpacman "sudo rm /var/lib/pacman/db.lck"
abbr -a tarnow tar -acf
abbr -a untar tar -zxvf
abbr -a wget wget -c
abbr -a psmem "ps auxf | sort -nr -k 4"
abbr -a psmem10 "ps auxf | sort -nr -k 4 | head -10"
abbr -a hw "hwinfo --short" # Hardware Info
abbr -a big "expac -H M '%m\t%n' | sort -h | nl" # Sort installed packages according to size in MB
abbr -a gitpkg "pacman -Q | grep -i "\-git" | wc -l" # List amount of -git packages
abbr -a update "sudo pacman -Syu"

# Cleanup orphaned packages
abbr -a cleanup "sudo pacman -Rns (pacman -Qtdq)"

# Get the error messages from journalctl
abbr -a jctl "journalctl -p 3 -xb"

# Recent installed packages
abbr -a recent "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# pnpm
set -gx PNPM_HOME "/home/chris/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
