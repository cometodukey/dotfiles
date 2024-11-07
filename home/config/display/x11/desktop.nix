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
        discord
        signal-desktop
        steam
        spotify
        libreoffice
        bitwarden
        vscode
    ];
}
