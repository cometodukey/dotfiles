{ config, inputs, lib, options, system, ... }:

{
    services.sxhkd = {
        enable = true;

        keybindings = {
            # Program bindings
            "super + Return" = "${config.programs.alacritty.package}/bin/alacritty";
            "super + b" = "${config.programs.firefox.package}/bin/firefox";
            # "super + e" = editor;
            # "super + r" = program launcher; 
            # "Print" = screenshot program;

            # Reloading
            "super + alt + {q,r}" = "bspc {quit,wm-r}";
            "super + alt + Escape" = "pkill -USR1 -x sxkhd";
            # quit/reload polybar
            # quit/reload program launcher

            # Window management
            "super + q" = "bspc node -c -k";
            # Move windows, send to workspace, resize, floating, tiling, etc
        };
    };
}