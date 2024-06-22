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
    calibre
  ];
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
