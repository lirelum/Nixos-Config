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
    texlive.combined.scheme-full
  ];

  programs.vim.defaultEditor = true;
}
