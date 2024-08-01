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

    lib-extension = final: prev: {
      lib =
        prev.lib
        // {
          local = let
            lib = final.lib;
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
        };
    };
  };
}
