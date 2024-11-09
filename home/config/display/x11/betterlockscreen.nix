{ config, ... }:

{
    services.betterlockscreen.enable = true;

    # TODO find a declarative way to do `betterlockscreen -u <wallpaper>`

    xdg = {
        enable = true;
        configFile = {
            "betterlockscreen/betterlockscreenrc" = {
                enable = true;
                text = ''
                lock_timeout=1800 # 30 minutes
                locktext="Enter password"
                '';
            };
        };
    };
}
