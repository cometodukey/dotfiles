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

                font-0 = "Dina:pixelsize=12";

                module-margin-left = 1;
                module-margin-right = 1;
                separator = "|";

                modules-left = "bspwm xwindow";
                modules-right = "net bat date";

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
                enable-click = true;
            };
            "module/xwindow" = {
                type = "internal/xwindow";

                label = "%title%";
            };
            "module/net" = {
                type = "internal/network";

                interval = 1;
                interface-type = "wired";
                label-connected = "Connected";
                label-disconnected = "Disconnected";
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
            "module/date" = {
                type = "internal/date";

                interval = 1;
                date = "%d/%m/%Y";
                time = "%H:%M";
                label = "%time% %date%";
            };
        };
    };
}
