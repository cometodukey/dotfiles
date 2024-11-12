# This module is responsible for managing the user desktop environment on systems which don't use a pre-packaged DE

{ config, inputs, lib, options, pkgs, system, ... }:

{
    imports = [
        ./alacritty.nix
        ./betterlockscreen.nix
        ./bspwm.nix
        ./firefox.nix
        ./polybar.nix
        ./picom.nix
        # ./redshift.nix
        ./rofi.nix
        ./sxhkd.nix
    ];

    home.sessionVariables = {
        BROWSER = "firefox";
        TERM = "alacritty";
    };

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        pavucontrol
        brightnessctl
        spectacle
        feh
        blueman
        discord
        signal-desktop
        steam
        spotify
        libreoffice
        bitwarden
        vscode
    ];

    services.mpris-proxy.enable = true;

    # xsession.pointerCursor.defaultCursor = "left_ptr";
    home.file.".xinitrc" = {
        executable = true;
        # xset -dmps
        # xset s off
        text =''
            ${pkgs.feh}/bin/feh --bg-fill "${../../../assets/wallpaper.jpg}" &
        '';
    };
}
