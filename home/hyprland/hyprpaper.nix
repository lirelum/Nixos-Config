{config, ...}: let
  wallpaper = "/home/${config.local.users.default.user}/wallpaper";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [wallpaper];
      wallpaper = [
        "HDMI-A-1,${wallpaper}"
        "DP-3,${wallpaper}"
      ];
    };
  };
}
