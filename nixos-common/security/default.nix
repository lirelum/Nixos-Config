{config, ...}: {
  security.pam.services.greetd.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  services.pcscd.enable = true;
  security.sudo = {
    execWheelOnly = true;
    extraConfig = ''
      Defaults requiretty
    '';
  };
}
