{ config, lib, options, pkgs, ... }:

{
    # Power config

    services.tlp.enable = true;

    # systemd.services.power_tuning = {
    #     script = "sudo powertop --auto-tune";
    #     wantedBy = [ "multi-user.target" ];
    # };
}
