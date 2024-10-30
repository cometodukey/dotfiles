{
    programs.alacritty = {
        enable = true;
        settings = {
            live_config_reload = true;
            window = {
                dimensions = {
                    lines = 24;
                    columns = 80;
                };
                padding = {
                    x = 10;
                    y = 10;
                };
                dynamic_padding = false;
                opacity = 0.9;
            };
            scrolling = {
                history = 100000;
                multiplier = 3;
            };
            font = {
                normal = {
                    family = "Terminus";
                    style = "Regular";
                };
                bold = {
                    family = "Terminus";
                    style = "Bold";
                };
                italic = {
                    family = "Terminus";
                    style = "Italic";
                };
                bold_italic = {
                    family = "Terminus";
                    style = "Bold Italic";
                };
                size = 12.0;
                offset = {
                    x = 0;
                    y = 0;
                };
                glyph_offset = {
                    x = 0;
                    y = 0;
                };
            };
            colors = {};
            bell.duration = 0;

        };
    };
}

