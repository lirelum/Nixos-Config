{...}: {
  flake.homeModules.common = {lib, ...}: {
    imports = lib.getModules [./.];
  };
}
