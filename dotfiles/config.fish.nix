{pkgs, ... }:

{ ... }:

{
  programs.fish = {
    enable = true;
    plugins = [{
        name = "bobthefish";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
          sha256 = "2d87a9bbf93d586d8ffa34d10f2a52ae5b29581505d5872fd6137c9aed412fd5";
        };
      }];
  };
}
