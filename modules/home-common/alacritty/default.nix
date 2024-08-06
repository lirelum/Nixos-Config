{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      shell.program = "${pkgs.zsh}/bin/zsh";
    };
  };
}
