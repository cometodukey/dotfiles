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

- [] betterlockscreen
- [] .xinitrc not running
- [] polybar
  - [] Wireless, wired, disconnected glyphs
  - [] Menu
    - [] poweroff, reboot, logout, suspend, lock
    - [] Desktop apps
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
