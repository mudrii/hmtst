{ config, lib, pkgs, ... }:

{

  home = {
#    packages = with pkgs; [ ];
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "bash";
      MANPAGER = "nvim -c 'set ft=man' -";
      TERM = "xterm-256color";
    };
#    file = {
#      ".config/nixpkgs/home.nix".source = dotfiles/home.nix;
#    };

  programs = {
    jq.enable = true;
    tmux.enable = true;
    fzf = {
      enable = true;
    };
    direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };
    fish = {
      enable = true;
    };
  };

}
