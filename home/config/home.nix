{ config, pkgs, libs, ... }:

{
    imports = [
        ./fonts.nix
        ./git.nix
        ./theme.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Environment variables

    home.sessionVariables = {
        EDITOR = "vim";
        PAGER = "bat";
    };

    # User packages

    home.packages = with pkgs; [
        wget
        curl
        bash
        jq
        htop
        file
        ripgrep
        fd
        binwalk
        # unblob
        pulseaudio
        brightnessctl
        pciutils
        usbutils
        powertop
        bat
    ];
}
