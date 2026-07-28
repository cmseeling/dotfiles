# dotfiles

I use [tuckr](https://github.com/RaphGL/Tuckr) which is an alternative to GNU Stow to manage my dotfile deployment.

### Chezmoi config template
~/.config/chezmoi/chezmoi.yaml

```
edit:
  command: hx

# diff:
#   command: delta
#   args:
#     - -s
#     - --navigate
#     - --dark

data:
  distro: [cachyos|fedora|alpine|opensuse]
  headless: [true|false]
  useMise: [true|false]
  compositors:
    niri: [true|false]
    cosmic: [true|false]
    gnome: [true|false]
    plasma: [true|false]

```
