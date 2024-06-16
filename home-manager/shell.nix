{
  config,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      shell = {
        program = "${pkgs.fish}/bin/fish";
      };
    };
  };

  programs.fish = {
    enable = true;
  };

  programs.starsip = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      default_shell = "${pkgs.fish}/bin/fish";
    };
  };
}
