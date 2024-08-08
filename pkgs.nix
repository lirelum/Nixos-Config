{
  perSystem = {pkgs, ...}: {
    packages = import ./pkgs/pkgs.nix pkgs;
  };
}
