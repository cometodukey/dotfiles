{ config, pkgs, ... }:

let
    docker = "${pkgs.docker}/bin/docker";
    jellyfin_port = 8096;
    media_dir = "/mnt/store/media";
    jellyfin_dir = "/mnt/store/services/jellyfin";
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
                        "${media_dir}:/media"
                        "${jellyfin_dir}:/jellyfin"
                    ];
                    ports = [ "${toString jellyfin_port}:${toString jellyfin_port}" ];
                    cmd = [
                        # "--device=nvidia.com/gpu=all"
                        # "--datadir /jellyfin/data"
                        # "--configdir /jellyfin/config"
                        # "--cachedir /jellyfin/cache"
                        # "--webdir /jellyfin/web"
                        # "--logdir /jellyfin/log"
                    ];
                };
            };
        };
    };
}
