{ config, pkgs, ... }:

{
    config.services.polybar =
    let
        empty = config.theme.bg-alt1;
        urgent = config.theme.red;
        foreground = config.theme.fg;
        background = config.theme.bg;
    in
    {
        package = pkgs.polybar.override {
            mpdSupport = true;
            pulseSupport = true;
        };

        enable = true;
        script = "polybar default &";

        config = {
            "bar/default" = {
                enable-ipc = true;
                width = "100%";
                height = 24;
                padding-left = 1;
                padding-right = 1;
                fixed-center = false;

                background = background;
                foreground = foreground;

                font-0 = "Space Mono:pixelsize=13";
                font-1 = "Noto Color Emoji:scale=10:style=Regular";
                font-2 = "FontAwesome6Free:style=Solid:size=10";
                font-3 = "FontAwesome6Free:style=Regular:size=10";
                font-4 = "FontAwesome6Brands:style=Regular:size=10";

                module-margin-left = 1;
                module-margin-right = 1;
                separator = "⟩";

                modules-left = "menu bspwm";
                modules-center = "xwindow music";
                modules-right = "mic audio eth wlan bat datetime tray";

                wm-restack = "bspwm";
            };
            "module/menu" = {
                type = "custom/script";
                # format = "⏻";
                # label-open = "⏻";
                # label-active-font = 2;
                exec = "echo ⏻";
                click-left = "rofi_menu";
            };
            "module/bspwm" = {
                type = "internal/bspwm";

                label-focused = "%index%";
                label-focused-background = foreground;
                label-focused-foreground = background;
                label-foucsed-underline = background;
                label-focused-padding = 1;

                label-occupied = "%index%";
                label-occupied-padding = 1;

                label-urgent = "%index%";
                label-urgent-background = urgent;
                label-urgent-padding = 1;

                label-empty = "%index%";
                label-empty-foreground = empty;
                label-empty-padding = 1;

                enable-scroll = false;
                enable-click = false;
            };
            "module/xwindow" = {
                type = "internal/xwindow";
                label = "%title%";
                label-maxlen = 60;
            };
            "module/music" = {
                # type = "internal/mpd";
                # host = "127.0.0.1";
                # port = "6600";
                # label-offline = "mpd offline";
                # label-song = "%artist% - %title%";
            };
            "module/mic" = {
                type = "custom/script";
                interval = 1;
                exec = "$HOME/dotfiles/home/bin/poll-mic-muted";
            };
            "module/audio" = {
                type = "internal/pulseaudio";
                interval = 5;
                click-right = "pavucontrol";
                label-volume = "🔊 %percentage%%";
                label-muted = "🔇 %percentage%%";
            };
            "module/eth" = {
                type = "internet/network";
                # label-active-font = 2;
                interval = 1;
                interface-type = "wired";
                label-connected = ""; # U+F6FF (Font Awesome 6 Free)
                label-disconnected = "⛔";
            };
            "module/wlan" = {
                type = "internal/network";
                # label-active-font = 2;
                interval = 1;
                interface-type = "wireless";
                label-connected = ""; # U+F1EB (Font Awesome 6 Free)
                label-disconnected = "⛔";
            };
            "module/bat" = {
                type = "internal/battery";

                label-active-font = 1;

                poll-interval = 1;
                full-at = 99;
                low-at = 15;

                battery = "BAT0";
                adapter = "AC";

                label-charging = "⚡ %percentage%%";
                label-discharging = "🔋 %percentage%%";
                # label-discharging = "%percentage%%";
            };
            "module/datetime" = {
                type = "internal/date";

                interval = 1;
                date = "%d/%m/%Y";
                time = "%H:%M:%S";
                label = "%time% %date%";
            };
            "module/tray" = {
                type = "internal/tray";
                tray-spacing = 1;
                tray-padding = 1;
            };
        };
    };
}
