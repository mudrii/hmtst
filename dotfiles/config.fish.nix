{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ccat = "pygmentize -f terminal256 -g -P style=monokai";
      cp = "cp -i";
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always | lless";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      grep = "grep --color=auto";
      gadcm = "git add -A; and git commit";
      gad = "git add .";
      gcm = "git commit";
      gdf = "git diff";
      gl = "git log";
      glg = "git log --color --graph --pretty --oneline";
      gpl = "git pull";
      gps = "git push";
      gst = "git status";
      la = "exa -alg --group-directories-first -s=type --icons";
      lless = "set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s' && set -gx LESS '-R' && less -m -g -i -J -u -Q";
      ll = "exa -la";
      ls = "exa";
      mv = "mv -i";
      ping = "ping -c3";
      ps = "ps -ef";
      rm = "trash-put";
      unrm = "trash-restore";
      rmcl = "trash-empty";
      rml = "trash-list";
      sudo = "sudo -i";
      suf = "su --shell=/usr/bin/fish";
      vdir = "vdir --color=auto";
    };
    plugins = [{
        name = "bobthefish";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "theme-bobthefish";
          rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
#          sha256 = lib.fakeSha256;
          sha256 = "zUngqEZgHLmlyvoiVO3MwJTSFsYD7t3XiP6yMzmMkBs=";
        };
      }];
  };
}
