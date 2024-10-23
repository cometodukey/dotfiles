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
        ports = [ 22 ];
    };
    # services.firewall.allowedTCPPorts = [ 22 ];
}
