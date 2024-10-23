{ config, lib, pkgs, ... }:

let
    cfg = config.custom;
in
{
    # Enable networking
    networking.networkmanager.enable = true;

    # sshd config
    config = lib.mkIf cfg.sshd {
        services.openssh = {
            enable = true;
            settings = {
                PasswordAuthentication = false;
                KbdInteractiveAuthentication = false;
                PermitRootLogin = "no";
                AllowGroups = [ "dialin" ];
            };
        };
    };
}
