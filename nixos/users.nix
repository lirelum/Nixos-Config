{
  users.users.lirelum = {
    isNormalUser = true;
    description = "vvvvvvvvvvvvvvvvv";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSVa1FUx6NEjul53wdP51KHxyuBjShOhLGkd86jd8PP lirelum@zundamon.local"
    ];
  };
}
