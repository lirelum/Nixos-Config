{ config, pkgs, ... }:

{
  home.username = "lirelum"
  home.homeDirectory = "/home/lirelum"

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
    iftop
    strace
    ltrace
    lsof
    pciutils
    usbutils
  ];
  
  programs.git = {
    enable = true;
    userName = "vvvvvvvvvvvvv";
    userEmail = lirelum@disroot.org;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color"
    };
  };

  programs.fish = {
    enable = true;
    useBablefish = true;
  };
  
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
};
