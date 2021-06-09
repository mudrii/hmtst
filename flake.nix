{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-21.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    #outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    #outputs = {self, ... }@inputs:
    {
      homeConfigurations = {
        mudrii = inputs.home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/mudrii";
          username = "mudrii";
          stateVersion = "21.05";
          configuration = { config, lib, pkgs, ... }:
            let
              overlay-unstable = final: prev: {
                unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
              };
            in
            {
              nixpkgs.overlays = [ overlay-unstable ];
              nixpkgs.config = { allowUnfree = true; };
              programs.home-manager.enable = true;
              imports = [
                ./home.nix
                #./modules/system-management/index.nix
              ];

              home.packages = with pkgs; [
              ];

              home.sessionVariables = {
                EDITOR = "nvim";
                SHELL = "bash";
                MANPAGER = "nvim -c 'set ft=man' -";
                TERM = "xterm-256color";
                #               file = {
                #                  ".config/nixpkgs/home.nix".source = dotfiles/home.nix;
                #               };
              };

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
                #bash = {
                #  enable = true;
                #};
                fish = {
                  enable = true;

                };
              };
            };
        };
      };
      #    mudrii = self.homeConfigurations.mudrii.activationPackage;
      #    defaultPackage.x86_64-linux = self.mudrii;
    };
}

