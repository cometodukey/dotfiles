{ config, pkgs, libs, ... }:

{
    imports = [
        ./git.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Environment variables

    home.sessionVariables = {
        EDITOR = "vim";
        BROWSER = "firefox";
        TERM = "alacritty";
    };

    # User packages

    home.packages = with pkgs; [
        wget
        bash
        jq
        htop
        file
        ripgrep
        fd
        binwalk
        # unblob
    ];
}
