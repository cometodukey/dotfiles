# The bspwm window manager home-manager module
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
          bspc monitor $mainmonitor \^1 -d I II III IV V VI VII VIII IX X
          bspc config border_width         0
          bspc config window_gap           10
          bspc config split_ratio          0.52
          bspc config borderless_monocle   true
          bspc config gapless_monocle      true
          bspc rule -a Emacs state=tiled
        '';
      };
    };
  };
}




