{
    # Audio config

    sound.enable = true;
    hardware.pulseaudio.enable = true;
    services.pipewire = {
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
