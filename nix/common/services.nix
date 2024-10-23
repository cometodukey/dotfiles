{ config, pkgs, ... }:

{
    # Enable networking
    networking.networkmanager.enable = true;

    # sshd config
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
            AllowGroups = [ "dialin" ];
        };
    };
}
