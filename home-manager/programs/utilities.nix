{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
    zip
    xz
    thunderbird
    unzip
    p7zip
    file
    which
    gnupg
    nix-output-monitor
    btop
    iotop
    strace
    ltrace
    lsof
    pciutils
    usbutils
    nextcloud-client
    keepassxc
    xclip
    discord
    signal-desktop
    zotero
    libreoffice
    gnome.file-roller
    gnome.gnome-disk-utility
    evince
    calibre
    logseq
    mc
  ];

  programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
}
