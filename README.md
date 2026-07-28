# dotfiles

I use [chezmoi](https://www.chezmoi.io/) to manage my dotfiles.

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
