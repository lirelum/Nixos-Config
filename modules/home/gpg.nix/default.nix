{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
  programs.gpg.enable = true;
}
