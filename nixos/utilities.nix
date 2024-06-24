{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
    texlive.combined.scheme-full
    gcc9
    rustup
  ];

  programs.vim.defaultEditor = true;
}
