{
  inputs,
  self,
  withSystem,
  ...
}: {
  flake.darwinConfigurations = {
    zundamon = withSystem "aarch64-darwin" ({
      system,
      inputs',
      pkgs,
      lib,
      ...
    }:
      inputs.nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {inherit inputs inputs' pkgs lib;};
        modules =
          [
            inputs.home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.lirelum.imports = [self.homeModules.common];
              home-manager.extraSpecialArgs = {inherit inputs inputs' pkgs lib;};
            }
          ]
          ++ lib.getModules [./.];
      });
  };
}
