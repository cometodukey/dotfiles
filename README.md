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

- [x] Bluetooth
  - [x] Drivers
  - [x] Userspace manager
- [] MIME type handlers
- [] betterlockscreen
- [] Night light
- [] .xinitrc not running
- [] polybar
  - [x] Wireless, wired, disconnected glyphs
  - [] Mic mute state
  - [x] Battery state icons not displaying
  - [] Bluetooth
  - [] Menu
    - [] poweroff, reboot, logout, suspend, lock
    - [] Desktop apps
- [x] Notification manager
- [] dunst config
- [] Monospace font
- [] Manual startx instead of running on boot
- [] unblob when it's in nixpkgs
- [] ZFS snapshots
- [] Move container filesystems to store/services
- [] Rewrite jellyfin container for docker with nvidia-container-toolkit
- [] Reverse proxy
- [] LetsEncrypt and DDNS
  - [] Look into secrets management
- [] Wireguard
- [] Ghidra server
