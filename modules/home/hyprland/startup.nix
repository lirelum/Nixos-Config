{pkgs, ...}: let
  startup = pkgs.writeShellScriptBin "startup" ''
    ${pkgs.waybar}/bin/waybar &
  '';
in {home.packages = [startup];}
