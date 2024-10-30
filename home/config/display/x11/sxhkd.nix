{ config, inputs, lib, options, pkgs, system, ... }:

let
    spectacle = "${pkgs.spectacle}/bin/spectacle";
in
{
    services.sxhkd = {
        enable = true;

        keybindings = {
            # Program bindings
            "super + Return" = "${config.programs.alacritty.package}/bin/alacritty";
            "super + b" = "${config.programs.firefox.package}/bin/firefox";
            # "super + e" = "$TERM -e $EDITOR";
            # "super + r" = program launcher; 
            "Print" = "${spectacle} -fcb"; # Fullscreen screenshot
            "shift + Print" = "${spectacle} -rcb"; # Selected region screenshot
            "shift + alt + Print" = "${spectacle} -acb"; # Selected window screenshot

            # Audio keys
            "{XF86AudioRaiseVolume,XF86AudioLowerVolume}" = "pactl set-sink-volume @DEFAULT_SINK@ {+,-}5%";
            "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";

            # Brightness
            "XF86MonBrightness{Up,Down}" = "brightnessctl set 5%{+,-}";

            # Reloading
            "super + alt + {q,r}" = "bspc {quit,wm -r}";
            "super + alt + Escape" = "pkill -USR1 sxkhd";
            "super + alt + p" = "systemctl --user restart polybar.service";
            # quit/reload program launcher

            # close/kill
            "super + {_,shift + }w" = "bspc node -{c,k}";

            # focus/swap

            # focus or send to the given desktop
            "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

            # focus the node in the given direction
            "super + {_,shift + } {h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

           # move/resize

           # expand a window by moving one of its side outward
           "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

          # contract a window by moving one of its side inward
          "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
        };
    };
}
