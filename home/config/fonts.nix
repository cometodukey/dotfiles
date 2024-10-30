{ pkgs, ... }:

{
    fonts.fontconfig = {
        enable = true;
        defaultFonts = {
            monospace = [ "Terminus" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };

    home.packages = with pkgs; [
        terminus_font
        noto-fonts-emoji
    ];
}

