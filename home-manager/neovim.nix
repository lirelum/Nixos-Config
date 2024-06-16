{
  pkgs,
  options,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nixvim = {
  };
}
