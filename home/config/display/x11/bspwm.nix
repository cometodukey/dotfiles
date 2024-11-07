{ lib, config, pkgs, ... }:

{
    xsession = {
        enable = true;
    };

    home.packages = [ config.xsession.windowManager.bspwm.package ];

    xdg = {
        enable = true;
        configFile = {
          "bspwm/bspwmrc" = {
            enable = true;
            executable = true;
            onChange = "bspc wm -r";
            text = ''
              #!/bin/sh
              mainmonitor="$(bspc query --monitors --names | head -n 1)"
              bspc monitor $mainmonitor -d 1 2 3 4 5 6 7 8 9 10
              bspc desktop -f 1
              bspc config border_width         0
              bspc config window_gap           10
              bspc config top_padding          24
              bspc config split_ratio          0.52
              bspc config borderless_monocle   true
              bspc config gapless_monocle      true
              bspc rule -r "*"
            '';
          };
        };
    };
}
