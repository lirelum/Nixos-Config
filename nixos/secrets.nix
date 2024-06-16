{
  security.pam.services.lirelum.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  services.pcscd.enable = true;
  programs.ssh.startAgent = false;

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';
}
