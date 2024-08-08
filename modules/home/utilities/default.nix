{pkgs, ...}: {
  home.packages = with pkgs; [
    zip
    unzip
    xz
    p7zip
    file
    which
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
    zotero
    libreoffice
    evince
    calibre
    thunderbird
    nvim
  ];
}
