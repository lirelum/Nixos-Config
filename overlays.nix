{
  inputs,
  self,
  ...
}: {
  imports = [./overlays];
  perSystem = {
    lib,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = lib.attrsets.mapAttrsToList (_: overlay: overlay) self.overlays;
      config.allowUnfree = true;
    };
    _module.args.lib = inputs.nixpkgs.lib.extend (
      final: prev: {
        local = let
          lib = final;
          getPaths = file: root:
            builtins.filter builtins.pathExists (
              map (dir: root + "/${dir}/${file}") (
                lib.attrNames (lib.filterAttrs (name: type: type == "directory") (builtins.readDir root))
              )
            );
        in {
          inherit getPaths;
          getModules = builtins.concatMap (getPaths "default.nix");
        };
      }
    );
  };
}
