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
        # enable = true;
        videoDrivers = [ "nvidia" ];
        # displayManager.lightdm.enable = true;
        # desktopManager.xfce.enable = true;
    };

    # Hostname

    networking.hostName = "homeserver";

    # Drivers, etc

    nixpkgs.config.nvidia.acceptLicense = true;
    hardware = {
        cpu.intel.updateMicrocode = true;
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };
        nvidia = {
            modesetting.enable = true;
            # powerManagement.enable = true;
            # powerManagement.finegrained = false;
            open = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };

    # Virtualisation

    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # ZFS

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

    # SMB
    # TODO revise security measures

    users.groups.store_access = {
        gid = 990;
    };
    users.users.duke.extraGroups = [ "store_access" "docker" ];

    containers.nas = {
        autoStart = true;
        restartIfChanged = true;
        privateNetwork = false;

        bindMounts = {
            "media" = {
                hostPath = "/mnt/store/media";
                mountPoint = "/smb/media";
                isReadOnly = false;
            };
            "home" = {
                hostPath = "/mnt/store/home";
                mountPoint = "/smb/home";
                isReadOnly = false;
            };
        };

        config = { ... }: {
            users.groups.store_access = {
                gid = 990;
            };

            users.users.duke = {
                isNormalUser = true;
                uid = 1000;
                description = "duke";
                group = "store_access";
            };

             services.samba = {
                enable = true;
                openFirewall = true;
                shares = {
                    "media" = {
                        path = "/smb/media";
                        "read only" = false;
                        "writable" = "yes";
                        "write list" = [ "duke" ];
                        "force user" = "duke";
                        "browseable" = "yes";
                        comment = "Multi-media share";
                    };
                    "home" = {
                        path = "/smb/home";
                        "read only" = false;
                        "writable" = "yes";
                        "write list" = [ "duke" ];
                        "force user" = "duke";
                        "browseable" = "yes";
                        "guest ok" = "no";
                        comment = "Home directory";
                    };
                };
            };
            networking.nftables.enable = true;
            networking.firewall = {
                enable = true;
            };
            system.stateVersion = "24.05";
        };
    };

    networking.firewall.allowedTCPPorts = [ 139 445 8096 ];
    networking.firewall.allowedUDPPorts = [ 137 138 ];

    # Jellyfin

    hardware.nvidia-container-toolkit.enable = true;
    # virtualisation.docker.enable = true;
    virtualisation.oci-containers = {
        backend = "docker";
        containers.jellyfin = {
            autoStart = true;
            image = "jellyfin/jellyfin:latest";
            volumes = [
                "/mnt/store/media:/media"
                "/mnt/store/services/jellyfin/cache:/cache"
                "/mnt/store/services/jellyfin/config:/config"
            ];
            cmd = [
                "--net=host"
                "--device=nvidia.com/gpu=all"
            ];
        };
    };

    containers.jellyfin = {
        autoStart = true;
        restartIfChanged = true;
        privateNetwork = false;

        bindMounts = {
            "media" = {
                hostPath = "/mnt/store/media";
                mountPoint = "/mnt/media";
                isReadOnly = true;
            };
            "dri" = {
                hostPath = "/dev/dri";
                mountPoint = "/dev/dri";
                isReadOnly = false;
            };
        };

        config = { pkgs, ... }: {
            environment.systemPackages = with pkgs; [
                jellyfin
                jellyfin-web
                jellyfin-ffmpeg
                pciutils
            ];
            services.jellyfin = {
                enable = true;
                openFirewall = true;
            };
            hardware.opengl = {
                enable = true;
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

