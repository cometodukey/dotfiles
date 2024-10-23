{
    # Network config

    networking.networkmanager.enable = true;

    # Firewall

    networking.nftables.enable = true;
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
    };
}
