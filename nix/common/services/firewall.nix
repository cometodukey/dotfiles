{
    # firewall config
    networking.nftables.enable = true;
    services.firewall = {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
    };
}
