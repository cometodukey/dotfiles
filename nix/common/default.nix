{ config, lib, pkgs, ... }:

{
    imports = [
        ./services.nix
    ];

    options.custom = {
        sshd = lib.mkOption { type = lib.types.bool; };

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
            openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXDY3uPlcjbux8rHd5Y8SuvTPV+a4mKrPzQtFPoFlxp Home Network" ];
            packages = with pkgs; [];
        };


        nixpkgs.config.allowUnfree = true;
        nix.settings.trusted-users = [ "root" "@wheel" ];
    };
}
