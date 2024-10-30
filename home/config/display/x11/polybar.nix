{
    config.services.polybar = {
       enable = true;
       script = "polybar default &";

        config = {
            "bar/default" = {
                enable-ipc = true;
                width = "100%";
                height = 24;
                padding-left = 0;
                padding-right = 0;
                fixed-center = false;

                font-0 = "Terminus:pixelsize=20";
                font-1 = "Noto Color Emoji:pixelsize=1";

                module-margin-left = 1;
                module-margin-right = 1;
                separator = "|";

                modules-left = "bspwm";
                modules-center = "xwindow";
                modules-right = "eth-net wlan-net bat audio datetime tray";

                wm-restack = "bspwm";
            };
            "module/bspwm" = {
                type = "internal/bspwm";

                label-focused = "%index%";
                label-focused-padding = 1;

                label-occupied = "%index%";
                label-occupied-padding = 1;

                label-urgent = "%index%";
                label-urgent-padding = 1;

                label-empty = "%index%";
                label-empty-padding = 1;

                enable-scroll = false;
                enable-click = false;
            };
            "module/xwindow" = {
                type = "internal/xwindow";
                label = "%title%";
                label-maxlen = 60;
            };
            "module/eth-net" = {
                type = "internet/network";
                interval = 1;
                interface-type = "wired";
                label-connected = "eth connected";
                label-disconnected = "eth disconnected";
            };
            "module/wlan-net" = {
                type = "internal/network";
                interval = 1;
                interface-type = "wireless";
                label-connected = "wlan connected";
                label-disconnected = "wlan disconnected";
            };
            "module/bat" = {
                type = "internal/battery";

                poll-interval = 1;
                full-at = 99;
                low-at = 15;

                battery = "BAT0";
                adapter = "AC";

                label-charging = "⚡%percentage%%";
                label-discharging = "🔋 %percentage%%";
            };
            "module/audio" = {
                type = "internal/pulseaudio";
                interval = 5;
                click-right = "pavucontrol";
                label-volume = "%percentage%%";
                label-muted = "Muted";
            };
            "module/datetime" = {
                type = "internal/date";

                interval = 1;
                date = "%d/%m/%Y";
                time = "%H:%M";
                label = "%time% %date%";
            };
            "module/tray" = {
                type = "internal/tray";
            };
        };
    };
}
