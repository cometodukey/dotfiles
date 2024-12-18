{ config, pkgs, ... }:

{
    imports = [
        ../hardware/homeserver.nix
        ../common/services/logrotate.nix
        ../common/services/sshd.nix
        ../common/default.nix

        ./homeserver/fileshare.nix
        ./homeserver/jellyfin.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "homeserver";

    hardware = {
        cpu.intel.updateMicrocode = true;
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    nixpkgs.config.nvidia.acceptLicense = true;
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement = {
            enable = true;
            # finegrained = true;
        };
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    environment.systemPackages = with pkgs; [ cryptsetup ];
    networking.hostId = "ceb9d53a";
    boot.initrd.luks = {
        reusePassphrases = true;
        devices = {
            "store0".device = "/dev/disk/by-uuid/d5647ee2-c8af-4346-a59c-ceb102bfcbb8";
            "store1".device = "/dev/disk/by-uuid/a267022e-791a-4a02-9117-f6bb9fad13b9";
            "store2".device = "/dev/disk/by-uuid/b1bb6c11-ab0c-452a-9f51-04485ff1564b";
            "store3".device = "/dev/disk/by-uuid/226a2f4f-a2f4-4158-b71c-f69a5622cf80";
        };
    };

    services.zfs = {
        autoScrub.enable = true;
        autoSnapshot.enable = true;
        trim.enable = true;
    };

    # TODO
    services.tlp.settings = {
        # DISK_DEVICES = ""; # Set to zpool/store drives
        # DISK_APM_LEVEL_ON_AC = "128";
        # DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0"; # Set to 4 hours
    };

    users.users.duke.extraGroups = [ "docker" ];
    hardware.nvidia-container-toolkit.enable = true;
    # virtualisation = {
    #     docker.rootless = {
    #         enable = true;
    #         setSocketVariable = true;
    #         daemon.settings = {
    #             data-root = "/mnt/store/docker/data";
    #         };
    #     };
    # };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05";# Did you read the comment?
}
