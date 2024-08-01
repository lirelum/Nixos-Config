{config, ...}: {
  security.pam.services.${config.username}.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  services.pcscd.enable = true;
  programs.ssh.startAgent = true;
  security.sudo = {
    execWheelOnly = true;
    extraConfig = ''
      Defaults requiretty
    '';
  };
}
