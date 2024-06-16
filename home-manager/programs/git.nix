{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    userName = "vvvvvvvvvvvvvvvv";
    userEmail = "lirelum@disroot.org";
    signing.key = "6E80E1135F140BDD09675B121E6E2D0C6523E91C";
    signing.signByDefault = true;
  };
}
