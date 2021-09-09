{ pkgs, ... }:

{

  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      userName = "Your Name";
      userEmail = "your_email@domain.ext";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        unstage = "reset HEAD --";
        pr = "pull --rebase";
        addp = "add --patch";
        comp = "commit --patch";
        co = "checkout";
        ci = "commit";
        c = "commit";
        b = "branch";
        p = "push";
        d = "diff";
        a = "add";
        s = "status";
        f = "fetch";
        pa = "add --patch";
        pc = "commit --patch";
        rf = "reflog";
        l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
        pp = "!git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)";
        recent-branches = "branch --sort=-committerdate";
      };
      extraConfig = {
        core.editor = "nvim";
        status = { showUntrackedFiles = "all"; };
        credential."https://github.com" = {
          #helper = "!${pkgs.gh}/bin/gh auth git-credential";
          helper = "!/run/current-system/sw/bin/gh auth git-credential";
        };
        remote = {
          push = [
            "refs/heads/*:refs/heads/*"
            "refs/tags/*:refs/tags/*"
          ];

          fetch = [
            "refs/heads/*:refs/remotes/origin/*"
            "refs/tags/*:refs/tags/*"
          ];
        };

        pull = {
          rebase = true;
        };

        rebase = {
          stat = true;
          autoSquash = true;
          autostash = true;
        };
      };
    };
  };

}
