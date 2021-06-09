{ pkgs, ... }:

{

  home-manager.users.mudrii.home.file.".tmux.conf".text = ''
        source ${pkgs.python38Packages.powerline}/share/tmux/powerline.conf

        set-option -g default-shell "/run/current-system/sw/bin/fish"

        set -g default-terminal "xterm-256color"
    #   set -g default-terminal "screen-256color"
        set -as terminal-overrides ",*:Tc"
    #   set -as terminal-overrides ",*-256color:Tc"
        setw -g xterm-keys on
        set -s escape-time 10
        set -sg repeat-time 600
        set -s focus-events on

        set -g prefix2 C-a
        bind C-a send-prefix -2
        unbind C-b

        set -q -g status-utf8 on
        setw -q -g utf8 on

        set -g history-limit 406000

        bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

        set -g base-index 1
        setw -g pane-base-index 1

        setw -g automatic-rename on
        set -g renumber-windows on

        set -g set-titles on
        set -g set-titles-string '#H:#S.#I.#P #W #T'

        set -g display-panes-time 800
        set -g display-time 1000

        set -g status-interval 10

        bind -n C-l send-keys C-l \; run 'sleep 0.1' \; clear-history

        set -g monitor-activity on
        set -g visual-activity off

        bind C-c new-session

        bind C-f command-prompt -p find-session 'switch-client -t %%'
              
        bind - split-window -v
        bind \\ split-window -h

        bind -r h select-pane -L  # move left
        bind -r j select-pane -D  # move down
        bind -r k select-pane -U  # move up
        bind -r l select-pane -R  # move right
        bind > swap-pane -D       # swap current pane with the next one
        bind < swap-pane -U       # swap current pane with the previous one

        bind + run 'cut -c3- ~/.tmux.conf | sh -s _maximize_pane "#{session_name}" #D'

        bind -r H resize-pane -L 2
        bind -r J resize-pane -D 2
        bind -r K resize-pane -U 2
        bind -r L resize-pane -R 2

        unbind n
        unbind p
        bind -r C-h previous-window
        bind -r C-l next-window
        bind Tab last-window
              
        set -g visual-bell on
        set -g bell-action any

        set -g update-environment -r

        set -g terminal-overrides 'xterm*:smcup@:rmcup@'
        set -wg xterm-keys       1

        set -g status-bg black
        set -g status-fg white

        set -g status-left-style fg=green

        set -g status-fg white
        set -g status-bg black
        set -g status-style bright

        set-window-option -g window-status-style fg=white
        set-window-option -g window-status-style bg=default
        set-window-option -g window-status-style dim

        set-window-option -g window-status-current-style fg=white
        set-window-option -g window-status-current-style bg=default
        set-window-option -g window-status-current-style bright

        set-window-option -g window-status-current-style bg=red

        setw -g monitor-activity on
        set -g visual-activity on
  '';

}
