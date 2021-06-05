{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ... }@inputs:
  {
    homeConfigurations = {
      nixtst = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/mudrii";
        username = "mudrii";
        stateVersion = "21.05";
        configuration = { config, lib, pkgs, ... }:
        {
          nixpkgs.config = { allowUnfree = true; };
          programs.home-manager.enable = true;
/*
          imports = [
            ./modules/system-management/index.nix
          ];
*/
          home.packages = with pkgs; [
	   terraform
	   tmux
          ];
        };
      };
    };
  };
}
