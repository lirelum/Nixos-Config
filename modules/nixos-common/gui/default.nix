{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_sessions = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome to NixOS!' --asterisks --cmd ${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };
}
