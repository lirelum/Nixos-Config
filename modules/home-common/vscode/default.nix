{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      kamadorueda.alejandra
      vscodevim.vim
    ];
  };
  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
