{ pkgs, ... }:

{
  programs = {
    tmux = {
      enable = true;
      #keyMode = "vi";
      terminal = "xterm-256color";
      historyLimit = 406000;
      prefix = "C-a";
      baseIndex = 1;
      shell = "${pkgs.fish}/bin/fish";
      extraConfig = ''
        source ${pkgs.python39Packages.powerline}/share/tmux/powerline.conf

        setw -g xterm-keys on
        set -sg repeat-time 600
        set -s focus-events on

        set -q -g status-utf8 on
        setw -q -g utf8 on

        setw -g automatic-rename on
        set -g renumber-windows on

        set -g set-titles on
        set -g set-titles-string '#H:#S.#I.#P #W #T'

        set -g display-panes-time 800
        set -g display-time 1000

        set -g status-interval 10

        set -g visual-bell on
        set -g bell-action any

        setw -g monitor-activity on
        set -g visual-activity on

        bind - split-window -v
        bind \\ split-window -h

        bind C-f command-prompt -p find-session 'switch-client -t %%'

        bind -r h select-pane -L  # move left
        bind -r j select-pane -D  # move down
        bind -r k select-pane -U  # move up
        bind -r l select-pane -R  # move right
        bind > swap-pane -D       # swap current pane with the next one
        bind < swap-pane -U       # swap current pane with the previous one

        bind -r H resize-pane -L 2
        bind -r J resize-pane -D 2
        bind -r K resize-pane -U 2
        bind -r L resize-pane -R 2
      '';
    };
  };
}