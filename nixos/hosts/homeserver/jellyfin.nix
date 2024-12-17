{ config, ... }:

let
    jellyfin_tcp_ports = [ 8096 8097 ];
in
{
    networking.firewall.allowedTCPPorts = [] ++ jellyfin_tcp_ports;

    virtualisation = {
        oci-containers = {
            backend = "docker";
            containers.jellyfin = {
                autoStart = true;
                image = "jellyfin/jellyfin:latest";
                volumes = [
                    "/mnt/store/media:/media"
                    "/mnt/store/services/jellyfin:/jellyfin"
                ];
                cmd = [
                    "-p localhost:8097:localhost:8096"

                    # The NVIDIA container runtime is installed elsewhere
                    "--device=nvidia.com/gpu=all"
                ];
            };
        };
    };

    containers.jellyfin = {
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
