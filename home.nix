{ config, pkgs, ... }:

{
  home.username = "lirelum";
  home.homeDirectory = "/home/lirelum";

  home.packages = with pkgs; [
    neofetch
    zip
    xz
    unzip
    p7zip
    file
    neovim
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
    userEmail = "lirelum@disroot.org";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
    };
  };

  programs.starship = {
    enable = true;
    settings = {};
  };

  programs.fish = {
    enable = true;
  };
  
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
