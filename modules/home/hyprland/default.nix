{pkgs, ...}: {
  imports = [
    ./rofi.nix
    ./waybar.nix
    ./startup.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
  home.packages = [pkgs.grimblast];
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [
      split-monitor-workspaces
    ];
    settings = {
      "$mod" = "SUPER";
      general = {
        gaps_out = 10;
      };
      exec-once = [
        "waybar"
        "pasystray"
        "startup"
        "hyprpaper"
      ];
      bind =
        [
          ", Print, exec, grimblast copy area"
          "$mod, F, exec, firefox"
          "$mod, M, exit"
          "$mod, T, exec, alacritty"
          "$mod, Q, killactive"
          "$mod, R, exec, rofi -show run"
          "$mod SHIFT, R, exec, rofi -show drun -show-icons"
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, u"
          "$mod, K, movefocus, d"
          "$mod, L, movefocus, r"
          "$mod, P, exec, ${pkgs.hyprlock}/bin/hyprlock"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, split-workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, split-movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      monitor = [
        "HDMI-A-1, 1920x1080, 1280x0, 1"
        "DP-3, 1280x1024, 0x0, 1"
        "Unkown-1, disable"
      ];
    };
  };
}
