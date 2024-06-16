{
  services.xserver.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.plasma5.enable = false;
  services.xserver.displayManager.defaultSession = "xfce";
}
