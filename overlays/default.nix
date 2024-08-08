{
  inputs,
  self,
  ...
}: {
  flake.overlays = {
    additions = final: prev: {
      local = self.packages.${final.system};
      nvim = inputs.nixvim-config.packages.${final.system}.default;
      hyprland = inputs.hyprland.packages.${final.system}.hyprland;
      hyprlandPlugins =
        prev.hyprlandPlugins
        // inputs.split-monitor-workspaces.packages.${final.system}
        // inputs.hyprland-plugins.packages.${final.system};
    };

    modifications = final: prev: {
      hyprland'.hyprland = prev.hyprland'.hyprland.override {
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
