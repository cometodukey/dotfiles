{ config, lib, pkgs, ... }:

let
    cfg = config.custom;
in
{
    config = lib.mkIf cfg.sshd {
        # sshd config
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
