{
  config,
  pkgs,
  lib,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "elementary-Xfce";
      package = pkgs.elementary-xfce-icon-theme;
    };
    theme = {
      name = "zukitre";
      package = pkgs.zuki-themes;
    };
  };
}
