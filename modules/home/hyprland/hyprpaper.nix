{config, ...}: let
  wallpaper = "/home/${config.local.users.default.user}/wallpaper";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [wallpaper];
      wallpaper = [
        "HDMI-1,${wallpaper}"
        "DP-3, ${wallpaper}"
      ];
    };
  };
}
