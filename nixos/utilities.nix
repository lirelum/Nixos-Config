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
    pinentry-curses
  ];

  services.pcscd.enable = true;

  programs.vim.defaultEditor = true;
}
