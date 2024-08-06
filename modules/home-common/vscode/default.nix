{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      kamadorueda.alejandra
      vscodevim.vim
    ];
  };
  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
