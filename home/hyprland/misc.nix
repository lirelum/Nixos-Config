{pkgs, ...}: let
  menu = pkgs.writeShellScriptBin "menu" ''
    if pgrep wofi; then
      pkill wofi
    else
      wofi --show drun
    fi
  '';
  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    if pgrep wlogout; then
      pkill wlogout
    else
      ${pkgs.wlogout}/bin/wlogout
    fi
  '';
in {
  programs.wlogout.enable = true;
  home.packages = [menu powermenu];
}
