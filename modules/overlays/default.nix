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
  };
}
