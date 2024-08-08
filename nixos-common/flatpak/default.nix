{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];
  xdg.portal.enable = true;
  services.flatpak = {
    enable = true;
    packages = [
      "org.signal.Signal"
    ];
  };
}
