{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    alejandra
    local.rebuild-nixos
  ];
  programs.vim.defaultEditor = true;
}
