{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
  ];
  programs.vim.defaultEditor = true;
}
