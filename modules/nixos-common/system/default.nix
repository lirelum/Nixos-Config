{
  config,
  pkgs,
  ...
}: let
  default = config.local.users.default;
in {
  users.groups.${default.user} = {
    gid = default.uid;
  };
  users.users.${default.user} = {
    extraGroups = [
      "users"
      "wheel"
    ];
    group = default.user;
    isNormalUser = true;
    shell = pkgs.bash;
    uid = default.uid;
    openssh.authorizedKeys.keys = default.keys;
  };
  system.stateVersion = "24.05";
  hm.home.stateVersion = "24.05";
}
