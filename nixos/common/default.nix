{ config, pkgs, ... }:

{
    imports = [
        ./network.nix
        ./power.nix
    ];

    # Timezone

    time.timeZone = "Europe/London";

    # Locale

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

    # System packages

    nixpkgs.config.allowUnfree = true;
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;

    environment.systemPackages = with pkgs; [
        vim
        wget
        curl
        git
    ];

    programs.vim.defaultEditor = true;

    # Groups

    users.groups.dialin = {};

    # Users

    users.users.duke = {
        isNormalUser = true;
        description = "duke";
        extraGroups = [ "networkmanager" "wheel" "dialin" ];
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXDY3uPlcjbux8rHd5Y8SuvTPV+a4mKrPzQtFPoFlxp Home Network" 
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHXyVnuPiZ0RT9JZqBnm3zmqErVecDO4dKbQ70KeyfuZ ecbruce@proton.me"
        ];
        packages = with pkgs; [];
        uid = 1000;
    };

    # Sudo

    security.sudo = {
        enable = true;
        extraRules = [
            {
                commands = [
                    {
                        command = "${pkgs.systemd}/bin/reboot";
                        options = [ "NOPASSWD" ];
                    }
                    {
                        command = "${pkgs.systemd}/bin/poweroff";
                        options = [ "NOPASSWD" ];
                    }
                ];
                groups = [ "wheel" ];
            }
        ];
    };

    # Nix

    nix = {
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 30d";
        };
        settings = {
            trusted-users = [ "root" "@wheel" ];
            experimental-features = [ "nix-command" "flakes"  ];
        };
    };
}
