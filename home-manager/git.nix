{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "vvvvvvvvvvvvvvvv";
    userEmail = "lirelum@disroot.org";
  };
}
