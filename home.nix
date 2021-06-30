{ config, lib, pkgs, ... }:

{

  imports = [
    ./dotfiles/.tmux.conf.nix
    ./dotfiles/.bashrc.nix
    ./dotfiles/config.fish.nix
    ./dotfiles/git.nix
  ];

  home = {
    packages = with pkgs; [
#      unstable.code-server
      google-cloud-sdk-gce
      pulumi-bin
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
      nodejs
      yarn
      nixpkgs-fmt
      pypi2nix
      nodePackages.node2nix
      poetry
      (python38.withPackages (ps: with ps; [
        pip
        powerline
        pygments
        pylint
        pynvim
      ]))
    ];

    file = {
      code-server = {
        source = ./dotfiles/code-server-config.yaml;
        target = ".config/code-server/config.yaml";
      };
    };

  };

  programs = {
    home-manager.enable = true;
    gpg.enable = true;
    fzf.enable = true;
    jq.enable = true;
    bat.enable = true;
    tmux.enable = true;
    command-not-found.enable = true;
    dircolors.enable = true;
    htop.enable = true;
    info.enable = true;
    exa.enable = true;
#    direnv = {
#      enable = true;
#      enableNixDirenvIntegration = true;
#    };
    neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = builtins.readFile dotfiles/.vimrc;
      plugins = with pkgs; [
        vimPlugins.vim-nix
        vimPlugins.vim-fish
        vimPlugins.vim-airline
        vimPlugins.vim-airline-themes
        vimPlugins.vim-devicons
        vimPlugins.vim-gitgutter
        vimPlugins.ctrlp-vim
        vimPlugins.vim-fugitive
        vimPlugins.fzf-vim
        vimPlugins.syntastic
        vimPlugins.coc-python
        vimPlugins.coc-nvim
        vimPlugins.coc-yaml
        vimPlugins.coc-json
        vimPlugins.coc-html
        vimPlugins.coc-lists
        vimPlugins.coc-eslint
        vimPlugins.coc-tsserver
        vimPlugins.coc-snippets
        vimPlugins.coc-pairs
        vimPlugins.coc-prettier
        vimPlugins.coc-markdownlint
        unstable.vimPlugins.nerdtree
        unstable.vimPlugins.nerdcommenter
        unstable.vimPlugins.nerdtree-git-plugin
        unstable.vimPlugins.vim-nerdtree-syntax-highlight
        unstable.vimPlugins.vim-snippets
        unstable.vimPlugins.vim-commentary
        unstable.vimPlugins.undotree
      ];
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
