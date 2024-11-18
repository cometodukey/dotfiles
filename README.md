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

- [] Install shell scripts to home dir and .local/bin equivalent
  - [] Run shellcheck over scripts as a pre install check
  - https://github.com/NixOS/nixpkgs/blob/91ff44d5dd20cb3e6e11af1e56754197d0695fd4/pkgs/build-support/trivial-builders/default.nix#L187-L299
- [x] Bluetooth
  - [x] Drivers
  - [x] Userspace manager
- [] MIME type handlers
- [] betterlockscreen
- [] Night light
- [] .xinitrc not running
- [] polybar
  - [] Scripts working improperly when running as service but not as background process
  - [x] Wireless, wired, disconnected glyphs
  - [x] Mic mute state
  - [x] Battery state icons not displaying
  - [x] Bluetooth (in tray)
  - [] mpd
  - [] Font
  - [] Menu
    - [] poweroff, reboot, logout, suspend, lock
    - [] Desktop apps
    - [] Extend rofi listview
- [] Use unfree predicate instead of blanket unfree
- [x] Notification manager
- [] dunst config
- [] notify-send on media keys
- [] Monospace font
- [] Manual startx instead of running on boot
- [] TLP config
- [] Dynamic timezone
- [] logrotate config
- [] unblob when it's in nixpkgs
- [] ZFS snapshots
- [] Move container filesystems to store/services
- [] Rewrite jellyfin container for docker with nvidia-container-toolkit
- [] Reverse proxy
- [] LetsEncrypt and DDNS
  - [] Look into secrets management
- [] Wireguard
- [] Ghidra server
- [] fail2ban
