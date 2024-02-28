# Cheat Sheet

This document contains the most used commands & keymaps regarding tmux.

This is not the whole list of what is available on tmux, if your usage is not listed below, please do check out the keymaps online.

- Create a new session

```zsh
tmux new-session -t <session-name>
```

- Attach to a session

```zsh
tmux attach -t <session-name>
```

- Detach from a session

```zsh
tmux detach -t <session-name>
```

- Detach from current session: `Prefix+d`

- Kill a session

```zsh
tmux kill-session -t <session-name>
```

- Create a window: `Prefix+c`
- Rename a window: `Prefix+,`
- Close current window: `Prefix+&`
- List windows: `Prefix+w`
- Switch window by number: `Prefix+<window-number>`

- List keymaps: `Prefix+?`
