{ config, lib, options, pkgs, ... }:

{
    services.tlp = {
        enable = true;
        settings = {
            START_CHARGE_THRESH_BAT0 = 70;
            STOP_CHARGE_THRESH_BAT0 = 90;
            RESTORE_THRESHOLDS_ON_BAT = 1;

            CPU_MIN_PERF_ON_AC = 20;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 20;
            CPU_MAX_PERF_ON_BAT = 80;

            DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";

            RUNTIME_PM_ON_AC = "on";
            RUNTIME_PM_ON_BAT = "auto";
        };
    };
}
