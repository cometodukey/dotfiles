{ config, lib, options, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        powertop
    ];

    # systemd.services.power_tuning = {
    #     script = "sudo powertop --auto-tune";
    #     wantedBy = [ "multi-user.target" ];
    # };

    services.tlp.enable = true;
}
