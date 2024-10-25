{
    # Display config

    # DRI acceleration

    hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;

    # X config
    # Uses default login manager + bspwm

    services.xserver = {
        enable = true;
        windowManager.bspwm.enable = true;
    };

    # services.xserver = {
    #     enable = true;

    #     libinput = {
    #         enable = true;

    #         # Disable mouse acceleration
    #         mouse = {
    #             accelProfile = "flat";
    #         };

    #         # Disable touchpad acceleration
    #         touchpad = {
    #             accelProfile = "flat";
    #         };
    #     };
    # };
}
