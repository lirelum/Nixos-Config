{
  inputs,
  pkgs,
  ...
}: let
  extensions = inputs.nix-vscode-extensions.extensions."x86_64-linux";
in {
  programs.vscode = {
    enable = true;
    extensions = with extensions.vscode-marketplace; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      vscodevim.vim
      kamadorueda.alejandra
    ];
  };

  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
