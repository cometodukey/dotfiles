# This module is responsible for managing the user desktop environment on systems which don't use a pre-packaged DE

{ config, inputs, lib, options, pkgs, system, ... }:

{
    imports = [
        ./alacritty.nix
        # ./betterlockscreen.nix
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
        discord
        signal-desktop
        steam
        spotify
        libreoffice
        bitwarden
        vscode
        mpc_cli
    ];

    services.dunst.enable = true; # Notification manager
    services.blueman-applet.enable = true;
    services.mpris-proxy.enable = true; # Bluetooth device media control
    xdg.userDirs.enable = true;
    services.mpd = {
        enable = true;
        network.startWhenNeeded = true;
    };

    # pkgs.writeShellScriptBin = {
    #     name = "rofi-menu";
    #     source = "../../../bin/rofi-menu";
    # };

    home.file.".profile" = {
        executable = true;
        text = "";
    };

    # xsession.pointerCursor.defaultCursor = "left_ptr";
    home.file.".xinitrc" = {
        executable = true;
        # xset -dpms
        # xset s off
        # cursor
        # sxhkd
        # bspwm
        # polybar default &
        text =''
            ${pkgs.feh}/bin/feh --bg-fill "${../../../assets/wallpaper.jpg}"
        '';
    };
}
