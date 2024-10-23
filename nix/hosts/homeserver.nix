{
    imports = [
        ../hardware/homeserver.nix
        ../common/default.nix
    ];

    # Bootloader
    # TODO switch to grub
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Hostname
    networking.hostName = "homeserver";
}
