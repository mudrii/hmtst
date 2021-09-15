{config, pkgs, lib, ...}:

let
  cfg = config.services.nixos-hm-auto-update;
  name = "nixos-hm-auto-update";
in

with lib;

{
 options.services.nixos-hm-auto-update = with types; {
   enable = mkEnableOption "Auto update NixOS Home manager onboot/weekly";
   gitPackage = mkOption {
     type = package;
     default = pkgs.git;
   };
 };

 config =
   let
     gitPath = "${cfg.gitPackage}/bin/git";
     mkStartScript = name: pkgs.writeShellScript "${name}.sh" ''
       set -euo pipefail
       PATH=/run/current-system/sw/bin:
       cd ~/.config/nixpkgs
       ${gitPath} pull origin main
       $HOME/.nix-profile/bin/home-manager switch --flake ".#$USER" -v
     '';
   in
   mkIf cfg.enable {
     systemd.user.services.nixos-hm-auto-update = {
       Unit = {
         Description = "Auto update NixOS home manager onboot/weekly";
       };
       Install = {
         WantedBy = [ "default.target" ];
       };
       Service = {       
         ExecStart = "${mkStartScript name}";
       };	  
     };

     systemd.user.timers.nixos-hm-auto-update = {
       Install = {
         WantedBy = [ "timers.target" ];
       };
       Timer = {
         OnBootSec = "10m"; # first run 10min after boot up
         #OnUnitActiveSec = "1w"; # run weekly
       };	  
     };
  };
}