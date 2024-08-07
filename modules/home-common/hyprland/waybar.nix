{config, ...}: {
  services = {
    network-manager-applet.enable = true;
  };

  programs.waybar = {
    enable = true;
    # package = inputs.waybar.packages."${pkgs.system}".waybar;
    settings = {
      mainBar = {
        height = 44;
        modules-left = ["custom/logo" "hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = [
          "tray"
          "cpu"
          "memory"
          "network"
          "clock"
        ];

        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";

          "icon-size" = 25;
          "tooltip-format" = "{title}";
        };
        "hyprland/window" = {
          "format" = "{title:30}";
          "max-length" = 30;
          "separate-outputs" = true;
        };

        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            "default" = "";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
        };

        tray = {spacing = 16;};

        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "󰥔  {:%I:%M %p}";
        };

        cpu = {
          "interval" = 10;
          "format" = "  {}%";
          "max-length" = 10;
        };

        memory = {
          interval = 30;
          format = "  {used:0.1f}G/{total:0.1f}G";
        };

        "network" = {
          "interface" = "wlp38s0";
          "format-wifi" = "   {essid} ({signalStrength}%)";
          "format-disconnected" = "";
          "tooltip-format-wifi" = "   {essid} ({signalStrength}%)";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };

        "custom/logo" = {
          format = "  ";
          tooltip = false;
          on-click = "menu";
        };

      };
    };
  };
}
