{ config, lib, options, pkgs, ... }:

{
    imports = [
        ../hardware/thinkpad.nix
        ../common/services/sshd.nix
        ../common/audio.nix
        ../common/default.nix
        ../common/display.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.luks.devices."luks-6f47f36f-cb26-4bf1-9b5b-0edb405e5c70".device = "/dev/disk/by-uuid/6f47f36f-cb26-4bf1-9b5b-0edb405e5c70";

    networking.hostName = "thinkpad";

    hardware = {
        cpu.intel.updateMicrocode = true;
        opengl.extraPackages = with pkgs; [ intel-media-sdk ];
        bluetooth = {
            enable = true;
            powerOnBoot = false;
        };
    };

    services = {
        blueman.enable = true;
        xserver.windowManager.bspwm.enable = true;
        tlp.settings = {
            INTEL_GPU_MIN_FREQ_ON_AC = 300;
            INTEL_GPU_MAX_FREQ_ON_AC = 1150;
            INTEL_GPU_BOOST_FREQ_ON_AC = 1150;

            INTEL_GPU_MIN_FREQ_ON_BAT = 300;
            INTEL_GPU_MAX_FREQ_ON_BAT = 800;
            INTEL_GPU_BOOST_FREQ_ON_BAT = 950;

            CPU_SCALING_GOVERNOR_ON_AC = "performance";
        };
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05";# Did you read the comment?
}
