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
    expressvpn
  ];

  programs.vim.defaultEditor = true;
}
