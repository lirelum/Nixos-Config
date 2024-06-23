{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
}
