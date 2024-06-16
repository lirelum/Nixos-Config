{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./starship.nix
    ./zellij.nix
  ];
}
