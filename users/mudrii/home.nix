{ config, pkgs, ... }:

{

  imports = [
    ./dotfiles/bashrc.nix
    ./dotfiles/fish.nix
    ./dotfiles/git.nix
    ./dotfiles/tmux.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      sshfs
      asciinema
      aspell
      aspellDicts.en
      tldr
      procs
      gitAndTools.gh
      git-crypt
      git-lfs
      gtop
      bpytop
      tree
      ripgrep
      file
      binutils
      fd
      trash-cli
      mosh
      highlight
      nix-index
      yarn
      nixpkgs-fmt
      nixpkgs-review
      pypi2nix
      nodePackages.node2nix
      unstable.python39Packages.poetry
      (python39.withPackages (ps: with ps; [
        pip
        powerline
        pygments
        pynvim
      ]))
    ];
  };

  programs = {
    home-manager.enable = true;
    gpg.enable = true;
    fzf.enable = true;
    jq.enable = true;
    bat.enable = true;
    command-not-found.enable = true;
    dircolors.enable = true;
    htop.enable = true;
    info.enable = true;
    exa.enable = true;

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
        enableFlakes = true;
      };
    };
  };

  services = {
    lorri.enable = true;
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };

}
