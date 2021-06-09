{ config, lib, pkgs, ... }:

{

  imports = [

  ];

  home = {
    packages = with pkgs; [
      bat
      htop
      gtop
      tree
      fzf
      file
      binutils
      fd
      nixops
      nix-index
      nix-deploy
      python2nix
      nodejs
      yarn
      nodePackages.node2nix
    ];
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "fish";
      MANPAGER = "nvim -c 'set ft=man' -";
      TERM = "xterm-256color";
    };
    #    file = {
    #      ".config/nixpkgs/home.nix".source = dotfiles/home.nix;
    #    };
  };

  programs = {
    home-manager.enable = true;
    jq.enable = true;
    tmux.enable = true;
    bash = {
      enable = true;
    };
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

  services = {
    lorri.enable = true;
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };

}
