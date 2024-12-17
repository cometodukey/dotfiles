{ config, ... }:

let
    smb_tcp_ports = [ 139 ];
    smb_udp_ports = [ 137 138 ];
in
{
    networking.firewall.allowedTCPPorts = [] ++ smb_tcp_ports;
    networking.firewall.allowedUDPPorts = [] ++ smb_udp_ports;

    users.groups.store_access = {
        gid = 990;
    };
    users.users.duke.extraGroups = [ "store_access" ];

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
}
