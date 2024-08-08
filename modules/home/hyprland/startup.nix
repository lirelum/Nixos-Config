{
  pkgs,
  config,
  ...
}: let
  startup = pkgs.writeShellScriptBin "startup" ''
    eval $(gnome-keyring-daemon --start --components=secrets,ssh);
    export SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh"

    wlr-randr --output "Unknown-1" --off
  '';
in {home.packages = [startup pkgs.wlr-randr];}
