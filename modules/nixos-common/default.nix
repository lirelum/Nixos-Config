{self, ...}: {
  flake.nixosModules.common = {
    inputs,
    lib,
    config,
    ...
  }: {
    imports =
      lib.local.getModules [./.]
      ++ [
        inputs.fps.nixosModules.programs-sqlite
        (lib.mkAliasOptionModule ["hm"] [
          "home-manager"
          "users"
        ])
        (lib.mkAliasOptionModule ["hm" "default"] [
          "home-manager"
          "users"
          config.local.users.default.user
        ])
      ];

    hm.default.imports = [
      self.homeModules.common
    ];

    nix = let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
  };
}
