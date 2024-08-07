{pkgs, ...}: let
  startup = pkgs.writeShellScriptBin "startup" ''
    ${pkgs.waybar}/bin/waybar &

    ${pkgs.wlr-randr}/bin/wlr-randr -- ouput "Unknown-1" -- off # To remove ghost monitor
  '';
in {home.packages = [startup];}
