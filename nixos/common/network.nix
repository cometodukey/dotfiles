{
    # Network config

    networking = {
        networkmanager.enable = true;
        nftables.enable = true;
        firewall = {
            enable = true;
            allowPing = true;
            allowedTCPPorts = [];
            allowedUDPPorts = [];
        };
    };
}
