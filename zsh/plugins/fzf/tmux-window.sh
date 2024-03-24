#!/usr/bin/env bash

if [[ -z "$TMUX_PANE" ]]; then
    echo "not in a tmux session"
fi

session_name=$(tmux list-panes -t "$TMUX_PANE" -F '#S' | head -n1)
if [[ $session_name == "personal" ]]; then
    path_to_search="$HOME/personal"
else
    path_to_search="$HOME/work"
fi

window_path=$(fd . $path_to_search --hidden --type d | fzf)
window_name=$(echo $window_path | awk -F "/" '{ if ($NF==""){print $(NF-1)}; if($NF!=""){print $NF} }')
tmux new-window -t "$session_name" -n "$window_name" "cd $window_path; exec zsh"
