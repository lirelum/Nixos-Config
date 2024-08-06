{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [
      hyprbars
    ];
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, M, exit"
          "$mod, T, exec, alacritty"
          "$mod, Q, killactive"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      monitor = [
        "HDMI-A-1, 1920x1080, 1280x0, 1"
        "DP-3, 1280x1024, 0x0, 1"
      ];
    };
  };
}
