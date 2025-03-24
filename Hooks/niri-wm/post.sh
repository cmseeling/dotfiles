#!/bin/sh

echo 'symlinking services for niri'
ln -s /usr/lib/systemd/user/mako.service ~/.config/systemd/user/niri.service.wants/
ln -s /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/
ln -s ~/.config/systemd/user/swaybg.service ~/.config/systemd/user/niri.service.wants/
ln -s ~/.config/systemd/user/swayidle.service ~/.config/systemd/user/niri.service.wants/
