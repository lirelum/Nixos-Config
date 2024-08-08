{
  pkgs,
  config,
  ...
}: let
  startup = pkgs.writeShellScriptBin "startup" ''
    eval $(gnome-keyring-daemon --start --components=secrets,ssh);
    export SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh"
  '';
in {home.packages = [startup];}
