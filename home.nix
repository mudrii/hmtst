{ config, lib, pkgs, ... }:

{

  imports = [

  ];

  home = {
    packages = with pkgs; [
      htop
      gtop
      bpytop
      tree
      fzf
      ripgrep
      file
      binutils
      fd
      mosh
      highlight
      nixops
      nix-index
      nodejs
      yarn
      nixpkgs-fmt
      pypi2nix
      nodePackages.node2nix
      poetry
      python39Full
      (python39.withPackages (ps: with ps; [
        pip
        powerline
        pygments
        pylint
        pynvim
      ]))
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
    bat.enable = true;
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
