{ config, pkgs, ... }:

let
    docker = "${pkgs.docker}/bin/docker";
in
{
    networking.firewall.allowedTCPPorts = [ 8096 8097 ];

    systemd.services.jellyfin = {
        description = "Jellyfin server";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        serviceConfig = {
            Type = "forking";
            ExecStart = "${docker} run --name jellyfin -v /mnt/store/services/jellyfin/:/jellyfin --runtime nvidia --device=nvidia.com/gpu=all -p 8097:8096 jellyfin/jellyfin:latest --datadir=/jellyfin/data --configdir=/jellyfin/config --cachedir=/jellyfin/cache --webdir=/jellyfin/web --logdir=/jellyfin/log";
            ExecStop = "${docker} stop jellyfin";
        };
    };

    # virtualisation = {
    #     oci-containers = {
    #         backend = "docker";
    #         containers = {
    #             jellyfin = {
    #                 autoStart = true;
    #                 image = "jellyfin/jellyfin:latest";
    #                 volumes = [
    #                     # "/mnt/store/media:/media"
    #                     # "/mnt/store/services/jellyfin:/jellyfin"
    #                 ];
    #                 ports = [ "8097:8096" ];
    #                 cmd = [
    #                     "--device=nvidia.com/gpu=all"
    #                     "--datadir /jellyfin/data"
    #                     "--configdir /jellyfin/config"
    #                     "--cachedir /jellyfin/cache"
    #                     "--webdir /jellyfin/web"
    #                     "--logdir /jellyfin/log"
    #                 ];
    #             };
    #         };
    #     };
    # };

    containers.jellyfinbak = {
        autoStart = true;
        restartIfChanged = true;
        privateNetwork = false;

        bindMounts = {
            "media" = {
                hostPath = "/mnt/store/media";
                mountPoint = "/mnt/media";
                isReadOnly = true;
            };
            "dri" = {
                hostPath = "/dev/dri";
                mountPoint = "/dev/dri";
                isReadOnly = false;
            };
        };

        config = { pkgs, ... }: {
            environment.systemPackages = with pkgs; [
                jellyfin
                jellyfin-web
                jellyfin-ffmpeg
                pciutils
            ];
            services.jellyfin = {
                enable = true;
                openFirewall = true;
            };
            hardware.opengl = {
                enable = true;
            };
            system.stateVersion = "24.05";
        };
    };
}
