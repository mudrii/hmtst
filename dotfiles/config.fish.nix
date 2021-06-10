{ pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ccat = "pygmentize -f terminal256 -g -P style=monokai";
      dmesg = "dmesg --color=always | lless";
      gadc = "git add -A; and git commit";
      gad = "git add .";
      gcm = "git commit";
      gch = "git checkout";
      gdf = "git diff";
      gl = "git log";
      glg = "git log --color --graph --pretty --oneline";
      gpl = "git pull";
      gps = "git push";
      gst = "git status";
      la = "exa --long --all --group --header --group-directories-first --sort=type --icons";
      lg = "exa --long --all --group --header --git";
      lt = "exa --long --all --group --header --tree --level ";
      lless = "set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s' && set -gx LESS '-R' && less -m -g -i -J -u -Q";
      rm = "trash-put";
      unrm = "trash-restore";
      rmcl = "trash-empty";
      rml = "trash-list";
      vdir = "vdir --color=auto";
      ossw = "sudo nixos-rebuild switch --flake '/etc/nixos/#nixtst' -v";
      hmsw = "home-manager switch --flake ~/.config/nixpkgs/#mudrii";
      upa = "nix flake update ~/.config/nixpkgs -v && sudo nix flake update '/etc/nixos/' -v";
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
     loginShellInit = ''
       eval (direnv hook fish)
    '';
     interactiveShellInit = ''
      if type -q direnv
        function __direnv_export_eval --on-variable PWD
          status --is-command-substitution; and return
          eval (direnv export fish)
        end
      else
        echo "Install direnv first! Check http://direnv.net" 2>&1
      end

      set -g theme_display_git yes
      set -g theme_display_git_dirty yes
      set -g theme_display_git_untracked yes
      set -g theme_display_git_ahead_verbose yes
      set -g theme_display_git_dirty_verbose yes
      set -g theme_display_git_stashed_verbose yes
      set -g theme_display_git_master_branch yes
      set -g theme_git_worktree_support no
      set -g theme_display_vagrant no
      set -g theme_display_docker_machine yes
      set -g theme_display_k8s_context yes
      set -g theme_display_hg no
      set -g theme_display_virtualenv yes
      set -g theme_display_ruby no
      set -g theme_display_user ssh
      set -g theme_display_hostname ssh
      set -g theme_display_vi no
      set -g theme_display_date no
      set -g theme_display_cmd_duration yes
      set -g theme_title_display_process yes
      set -g theme_title_display_path yes
      set -g theme_title_display_user yes
      set -g theme_title_use_abbreviated_path no
      set -g theme_avoid_ambiguous_glyphs yes
      set -g theme_powerline_fonts yes
      set -g theme_nerd_fonts no
      set -g theme_show_exit_status yes
      set -g theme_color_scheme dark
      set -g fish_prompt_pwd_dir_length 0
      set -g theme_project_dir_length 1

      set --universal fish_greeting
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x PAGER less
      set -x LESS -R
      set -x TERM xterm-256color
      set -x VISUAL nvim
      set -x EDITOR nvim

      function __fish_command_not_found_handler --on-event fish_command_not_found
        command-not-found $argv[1]
      end
    '';
  };

  home = {
    file = {
      fish_greeting = {
        source = ./fish/fish_greeting.fish;
        target = ".config/fish/functions/fish_greeting.fish";
      };
      fish_user_key_bindings = {
        source = ./fish/fish_user_key_bindings.fish;
        target = ".config/fish/functions/fish_user_key_bindings.fish";
      };
    };
  };
}
