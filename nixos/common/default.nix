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
        powertop
    ];

    programs.vim.defaultEditor = true;

    # Fonts

    fonts = {
        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            liberation_ttf
            fira-code
            fira-code-symbols
            terminus-font
            proggyfonts
        ];

        fontconfig = {
            defaultFonts = {
                monospace = [ "terminus-font" ];
            };
        };
    };

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

    # Nix

    nix.settings.trusted-users = [ "root" "@wheel" ];
}
