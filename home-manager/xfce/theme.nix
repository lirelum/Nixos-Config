{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    elementary-xfce-icon-theme
    zuki-themes
  ];
}
