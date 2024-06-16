{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
    zip
    xz
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
    discord
    signal-desktop
  ];
}
