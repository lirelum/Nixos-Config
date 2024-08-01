{
  inputs,
  self,
  ...
}: {
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    system,
    lib,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        self.overlays.additions
        self.overlays.modifications
        self.overlays.unstable-packages
        self.overlays.lib-extension
      ];
      config.allowUnfree = true;
    };

    _module.args.lib = lib.extend (
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
  flake.overlays = {
    additions = final: _prev: {
      local = self.${final.system}.packages;
    };

    modifications = final: prev: {
    };

    unstable-packages = final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    };
  };
}
