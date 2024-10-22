{
    imports = [
        ../hardware/homeserver.nix
        ../common/default.nix
    ];

    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.useOSProber = true;

    boot.initrd.luks.devices."luks-539797c1-fc40-4d19-8861-70867a2b2451".device = "/dev/disk/by-uuid/539797c1-fc40-4d19-8861-70867a2b2451";
    # Setup keyfile
    boot.initrd.secrets = {
        "/crypto_keyfile.bin" = null;
    };

    boot.loader.grub.enableCryptodisk=true;

    boot.initrd.luks.devices."luks-eccba579-de78-4f4b-801b-22535f7e14fd".keyFile = "/crypto_keyfile.bin";
    boot.initrd.luks.devices."luks-539797c1-fc40-4d19-8861-70867a2b2451".keyFile = "/crypto_keyfile.bin";

    networking.hostName = "homeserver";
}
