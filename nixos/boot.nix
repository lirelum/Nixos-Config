{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-53d81db8-4c03-42a9-9bd1-b64519178fab".device = "/dev/disk/by-uuid/53d81db8-4c03-42a9-9bd1-b64519178fab";
}
