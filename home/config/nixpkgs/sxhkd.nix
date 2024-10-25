{ config, inputs, lib, options, system, ... }:

{
    services.sxhkd = {
        enable = true;

        keybindings = {
            "super + Return" = "${config.programs.alacritty.package}/bin/alacritty";
            "super + b" = "${config.programs.firefox.package}/bin/firefox";
        };
    };
}
