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
    gcc9
    rustup
    ghcup
  ];

  programs.vim.defaultEditor = true;
}
