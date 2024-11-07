{
    location.provider = "geoclue2";
    services.redshift = {
        enable = true;
        brightness = {
            day = "1";
            night = "1";
        };
        temperature = {
            day = "4000";
            night = "4000";
        };
    };
}

