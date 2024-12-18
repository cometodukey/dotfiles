{ config, pkgs, ... }:

let
    jellyfin_port = 8096;
    media_dir_host = "/mnt/store/media";
    media_dir_guest = "/media";
    jellyfin_dir_host = "/mnt/store/services/jellyfin";
    jellyfin_dir_guest = "/var/jellyfin";
in
{
    networking.firewall.allowedTCPPorts = [ jellyfin_port ];

    virtualisation = {
        oci-containers = {
            backend = "docker";
            containers = {
                jellyfin = {
                    autoStart = true;
                    image = "jellyfin/jellyfin:latest";
                    volumes = [
                        "${media_dir_host}:${media_dir_guest}"
                        "${jellyfin_dir_host}:${jellyfin_dir_guest}"
                    ];
                    ports = [ "${toString jellyfin_port}:${toString jellyfin_port}" ];
                    extraOptions = [ "--device=nvidia.com/gpu=all" ];
                    environment = {
                        JELLYFIN_DATA_DIR = "${jellyfin_dir_guest}/data";
                        JELLYFIN_CONFIG_DIR = "${jellyfin_dir_guest}/config";
                        JELLYFIN_CACHE_DIR = "${jellyfin_dir_guest}/cache";
                        JELLYFIN_LOG_DIR = "${jellyfin_dir_guest}/log";
                    };
                };
            };
        };
    };
}
