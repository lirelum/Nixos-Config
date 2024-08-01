{config, ...}: {
  security.pam.services.${config.local.users.default.user}.enableGnomeKeyring = true;
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
