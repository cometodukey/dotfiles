{ config, pkgs, ... }:

{
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
}
