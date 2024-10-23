{ config, pkgs, ... }:

{
    imports = [
        ./services.nix
    ];

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        curl
        git
    ];

    # Groups

    users.groups.dialin = {};

    # Users

    users.users.duke = {
        isNormalUser = true;
        description = "duke";
        extraGroups = [ "networkmanager" "wheel" "dialin" ];
        openssh.authorizedKeys.keyFiles = [ ".ssh/authorized_keys" ];
        packages = with pkgs; [];
    };

    system.stateVersion = "24.05";
}
