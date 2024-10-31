{ config, pkgs, ... }:

{
    imports = [
        ../hardware/homeserver.nix
        ../common/services/logrotate.nix
        ../common/services/sshd.nix
        ../common/default.nix
    ];

    # Bootloader

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Display

    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
        displayManager.lightdm.enable = true;
        desktopManager.xfce.enable = true;
    };

    # Hostname

    networking.hostName = "homeserver";

    # Drivers, etc

    hardware = {
        cpu.intel.updateMicrocode = true;
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };
        nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            open = false;
        };
    };

    # Virtualisation

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # ZFS

    boot.extraModulePackages = with config.boot.kernelPackages; [ zfs ];
    environment.systemPackages = with pkgs; [ zfs ];
    #boot.supportedFileSystems = [ "zfs" ];
    #boot.zfs.forceImportRoot = false;

    # Containers

    containers.nas = {
        # autoStart = true;
        restartIfChanged = true;
        privateNetwork = false;

        bindMounts = {
            "media" = {
                hostPath = "";
                mountPoint = "/smb/media";
                isReadOnly = false;
            };
        };

        config = { ... }: {
             services.samba = {
                # enable = true;
                openFirewall = true;
                shares = {
                    public = {
                        path = "/smb/media";
                        "read only" = false;
                        "browseable" = "yes";
                        "guest ok" = "no";
                        comment = "Multi-media share";
                    };
                };
            };
            system.stateVersion = "24.05";
        };
    };

    #

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05";# Did you read the comment?
}

