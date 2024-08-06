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
    lib,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        self.overlays.additions
        self.overlays.modifications
        self.overlays.unstable-packages
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
    additions = final: prev: {
      local = self.packages.${final.system};
      nvim = inputs.nixvim-config.packages.${final.system}.default;
      hyprlandPlugins = prev.hyprlandPlugins // inputs.hyprland-virtual-desktops.packages.${final.system};
    };

    modifications = final: prev: {
      hyprland = prev.hyprland.override {
        enableXWayland = true;
        legacyRenderer = false;
        withSystemd = true;
      };
    };

    unstable-packages = final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = final.system;
        config.allowUnfree = true;
      };
    };
  };
}
