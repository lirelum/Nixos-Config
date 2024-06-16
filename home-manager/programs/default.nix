{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./firefox.nix
    ./git.nix
    ./neovim.nix
    ./utilities.nix
    ./shell
  ];
}
