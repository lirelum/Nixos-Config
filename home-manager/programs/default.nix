{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./firefox.nix
    ./git.nix
    ./utilities.nix
    ./shell
    ./code
  ];
}
