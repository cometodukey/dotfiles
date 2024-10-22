{
    imports = [
        ../hardware/homeserver.nix
        ../common/default.nix
    ];

    networking.hostName = "homeserver";
}
