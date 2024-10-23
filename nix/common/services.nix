{ config, pkgs, ... }:

{
    # Enable networking
    networking.networkmanager.enable = true;

    # sshd config
    # TODO make optional
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
            PermitRootLogin = "no";
            AllowGroups = [ "dialin" ];
        };
    };
}
