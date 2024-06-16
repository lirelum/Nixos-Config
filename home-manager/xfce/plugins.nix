{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.xfce4-appfinder
    xfce.xfce4-panel
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-cpugraph-plugin
    xfce.xfce4-systemload-plugin
  ];
}
