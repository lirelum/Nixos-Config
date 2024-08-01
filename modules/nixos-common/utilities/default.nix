{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    local.rebuild-nixos
  ];
  programs.vim.defaultEditor = true;
}
