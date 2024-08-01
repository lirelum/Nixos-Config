{
  withSystem,
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.miku = withSystem "x86_64-linux" (
    {
      pkgs,
      inputs',
      lib,
      ...
    }:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs inputs' pkgs lib;};
        modules =
          [
            self.nixosModules.common
            inputs.home-manager.nixosModules.home-manager
          ]
          ++ lib.local.getModules [./.];
      }
  );
}
