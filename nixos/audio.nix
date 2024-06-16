{
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alse.enable = true;
    alse.support23Bit = true;
    pulse.enable = true;
  };
}
