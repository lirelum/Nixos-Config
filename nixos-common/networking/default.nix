{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.local = {
    hostname = mkOption {type = types.str;};
  };

  config = {
    networking.hostName = config.local.hostname;
    networking.networkmanager.enable = true;

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      ipv4 = true;
      ipv6 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    programs.ssh.startAgent = false;
    environment.sessionVariables.SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };
}
