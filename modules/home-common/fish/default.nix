{
  programs.fish = {
    enable = true;
  };
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
