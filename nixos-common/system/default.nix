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
    shell = pkgs.zsh;
    uid = default.uid;
    openssh.authorizedKeys.keys = default.keys;
  };
  programs.zsh.enable = true;
  system.stateVersion = "24.05";
  hm.home.stateVersion = "24.05";
}
