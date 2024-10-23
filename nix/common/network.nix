{
    # Enable networking
    networking.networkmanager.enable = true;

    # firewall config
    networking.nftables.enable = true;
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
    };
}
