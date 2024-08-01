{lib, ...}: let
  inherit (lib) mkOption types;
in {
  options.local.users = {
    default = {
      user = mkOption {type = types.str;};
      name = mkOption {type = types.str;};
      email = mkOption {type = types.str;};
      uid = mkOption {type = types.int;};
      keys = mkOption {type = types.listOf types.singleLineStr;};
    };
    users = mkOption {type = types.attrsOf (types.attrs);};
  };
  config.local.users = {
    default = {
      user = "lirelum";
      name = "vvvvvvvvvvvvvvv";
      email = "lirelum@disroot.org";
      uid = "1000";
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSVa1FUx6NEjul53wdP51KHxyuBjShOhLGkd86jd8PP lirelum@zundamon.local"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuaNvM8eOQngd7kn3WJXDcecyafi1wl6pdCuvu0zABl lirelum@zundamon.local"
      ];
    };
  };
}
