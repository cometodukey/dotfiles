{ config, lib, options, ... }:

{
    # Display config

    # DRI acceleration

    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };

    # X config
    # Uses default login manager + bspwm

    services.xserver = {
        enable = true;
        windowManager.bspwm.enable = true;
    };

    # TODO fix touchpad lag
    services.libinput = {
        enable = true;
        mouse.accelProfile = "flat";
        touchpad.accelProfile = "flat";
    };
}
