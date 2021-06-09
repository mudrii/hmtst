# enables $?
function bind_status
  commandline -i (echo '$status')
end

# enables $$
function bind_self
  commandline -i (echo '%self')
end

# enable keybindings
function fish_user_key_bindings
  bind '$?' bind_status
  bind '$$' bind_self
end

function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end
