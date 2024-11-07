{ config, inputs, lib, options, pkgs, system, ... }:

{
    imports = [
        ./alacritty.nix
        ./bspwm.nix
        ./firefox.nix
        ./polybar.nix
        ./picom.nix
        # ./redshift.nix
        ./sxhkd.nix
    ];

    home.sessionVariables = {
        BROWSER = "firefox";
        TERM = "alacritty";
    };

    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        pavucontrol
        discord
        signal-desktop
        steam
        spotify
        libreoffice
        bitwarden
        vscode
    ];
}
