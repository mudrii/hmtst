{ config, ... }:

{

  programs.bash = {
    enable = true;
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    historyFileSize = 1000000;
    historySize = 100000;
    initExtra = ''
      source ~/.git-completion.bash
      source ~/.git-prompt.sh
      eval "$(direnv hook bash)"
      PS1="\n\[\033[1;32m\]\e[0;31m[\[\e]0;\u@\h: \w\a\]\e[01;32m\u@\[\e[1;34m\]\h:\[\e[01;36m\]\w\[\e[01;32m\]\e[0;31m]\[\033[0m\]\$(__git_ps1)\[\e[01;32m\]\$\[\033[0m\] "
      '';
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
    };
}
