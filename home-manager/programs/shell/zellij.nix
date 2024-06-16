{
  config,
  pkgs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      default_shell = "${pkgs.fish}/bin/fish";
    };
  };
}
