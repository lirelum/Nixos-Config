{
  config,
  pkgs,
  ...
}: {
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
  ];

  programs.vim.defaultEditor = true;
}
