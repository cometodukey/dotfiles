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
        pciutils
        usbutils
        powertop
        bat
    ];

    # home.file.".local/bin/poll-mic-muted" = {
    #     executable = true;
    #     source = "bin/poll-mic-muted";
    # };
}
