{...}: {
  flake.homeModules.common = {
    lib,
    config,
    ...
  }: {
    imports = lib.local.getModules [./.];
  };
}
