{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.fish}/bin/fish";
    };
  };
}
