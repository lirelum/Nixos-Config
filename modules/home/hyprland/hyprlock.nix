{config, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = [
        {
          path = "/home/${config.local.users.default.user}/wallpaper";
          blue_passes = 3;
          blur_size = 8;
        }
      ];
      label = [
        {
          monitor = "";
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          font_size = 90;
          position = "-130, -100";
          halign = "right";
          valign = "top";
          shadow_passes = 2;
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202,211,245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };
}
