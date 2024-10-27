{ config, inputs, lib, options, system, ... }:

{
    xsession = {
        enable = true;
        windowManager.bspwm.enable = true;
    };

    home.packages = [ config.xsession.windowManager.bspwm.package ];

    xdg = {
        enable = true;
        configFile = {
            "bspwm/bspwmrc".text = ''
              #!/usr/bin/env sh
              monitor="$(bspc query --monitors --names | head -n 1)"
              bspc "$monitor" -d 1 2 3 4 5 6 7 8 9 10
              bspc config border_width 1
              bspc config window_gap 50
              bspc config top_padding 24
              bspc config focus_follows_pointer true
              bspc rule -r "*"
            '';
        };
    };

}
