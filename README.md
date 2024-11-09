# dotfiles

Multi-host NixOS configuration.

## Installation

System level config:
`nixos-rebuild switch --flake .#name`

User level config:
`home-manager switch --flake .#name`

betterlockscreen wallpaper:
`betterlockscreen -u <wallpaper>`

## TODO

- [] Wallpaper set on X login
- [] betterlockscreen
- [] Night light
- [] .xinitrc not running
- [] polybar
  - [x] Wireless, wired, disconnected glyphs
  - [] Mic mute state
  - [] Battery state icons not displaying
  - [] Menu
    - [] poweroff, reboot, logout, suspend, lock
    - [] Desktop apps
- [] Notification manager
- [] Monospace font
- [] Manual startx instead of running on boot
- [] unblob when it's nixpkgs
- [] ZFS snapshots
- [] Move container filesystems to store/services
- [] Rewrite jellyfin container for docker with nvidia-container-toolkit
- [] Reverse proxy
- [] LetsEncrypt and DDNS
  - [] Look into secrets management
- [] Wireguard
- [] Ghidra server
