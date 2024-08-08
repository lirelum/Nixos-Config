{
  flake.homeModules.common = {lib, ...}: {
    imports = lib.local.getModules [./home];
  };
}
