# Tmux Daily Exercises

Work through one day at a time. Practice each day's exercises until they feel automatic before moving on.

---

## Day 1: Sessions

**Goal**: Create, navigate, and manage sessions.

1. Start a new named session: `tmux new -s work`
2. Detach from it: `Ctrl+a d`
3. List sessions from outside: `tmux ls`
4. Create a second session: `tmux new -s scratch`
5. Detach and reattach to the first: `tmux attach -t work`
6. Switch between sessions from inside: `Ctrl+a s` (pick from list)
7. Rename current session: `Ctrl+a $`
8. Kill a session from outside: `tmux kill-session -t scratch`

**Checkpoint**: Create 3 named sessions, switch between them, kill one, reattach to another.

---

## Day 2: Windows

**Goal**: Work with multiple windows (tabs) in a session.

1. Create a new window: `Ctrl+a c`
2. Rename the window: `Ctrl+a ,`
3. Move to next window: `Ctrl+a n`
4. Move to previous window: `Ctrl+a p`
5. Jump to window by number: `Ctrl+a 1`, `Ctrl+a 2`, etc.
6. List all windows: `Ctrl+a w`
7. Close a window: type `exit` or `Ctrl+d` in the shell

**Checkpoint**: Create 4 windows named "editor", "server", "logs", "misc". Jump between them by number and by list.

---

## Day 3: Panes (Splitting)

**Goal**: Split your terminal and navigate panes.

1. Split horizontally (side by side): `Ctrl+a |`
2. Split vertically (top/bottom): `Ctrl+a -`
3. Navigate panes: `Ctrl+a h/j/k/l`
4. Close a pane: `Ctrl+d` or `exit`
5. Toggle zoom on a pane (fullscreen it): `Ctrl+a z`
6. Show pane numbers: `Ctrl+a q` (then press a number to jump)

**Checkpoint**: Create a 3-pane layout — one large pane on the left, two stacked on the right. Navigate between all three without the mouse.

---

## Day 4: Panes (Resizing & Layouts)

**Goal**: Resize panes and use preset layouts.

1. Resize panes: `Ctrl+a H/J/K/L` (hold for continuous resize)
2. Cycle through preset layouts: `Ctrl+a Space`
3. Even out all panes horizontally: `Ctrl+a` then `:select-layout even-horizontal`
4. Even out all panes vertically: `Ctrl+a` then `:select-layout even-vertical`
5. Swap current pane with the previous: `Ctrl+a {`
6. Swap current pane with the next: `Ctrl+a }`
7. Rotate panes: `Ctrl+a Ctrl+o`

**Checkpoint**: Create 4 panes. Resize them unevenly, then cycle through all preset layouts with Space. Swap two panes.

---

## Day 5: Copy Mode & Scrollback

**Goal**: Search and copy text without the mouse.

1. Enter copy mode: `Ctrl+a [`
2. Scroll up/down: arrow keys or `k/j` (vim keys if configured)
3. Search backward: `/` then type search term
4. Search forward: `?` then type search term
5. Start selection: `Space`
6. Copy selection: `Enter`
7. Paste buffer: `Ctrl+a ]`
8. Exit copy mode: `q`

**Checkpoint**: Run `ls -la /`, enter copy mode, search for a filename, select it, copy it, paste it into the command line.

---

## Day 6: Command Mode & Config

**Goal**: Use the tmux command prompt and tweak settings live.

1. Open command prompt: `Ctrl+a :`
2. Try these commands live:
   - `set -g status-position bottom` (move status bar)
   - `set -g status-position top` (move it back)
   - `setw -g window-status-current-style "fg=green,bold"`
   - `display-message "hello from tmux"`
3. Reload your config: `Ctrl+a r`
4. List all key bindings: `Ctrl+a ?`
5. List all options: `Ctrl+a :` then `show-options -g`

**Checkpoint**: Change your status bar color live, check the key bindings list, then reload your config to reset.

---

## Day 7: Putting It All Together

**Goal**: Simulate a real dev workflow.

1. Create a session called "project": `tmux new -s project`
2. Rename window 1 to "editor", open your editor
3. Create window 2 named "server" (`Ctrl+a c`, then `Ctrl+a ,`)
4. Create window 3 named "logs"
5. Go to window 3, split into 2 panes (`Ctrl+a |`)
   - Left pane: `tail -f /var/log/system.log` (or any log)
   - Right pane: keep as a scratch terminal
6. Jump to window 1 (`Ctrl+a 1`), split it (`Ctrl+a -`)
   - Top: editor
   - Bottom: terminal for running commands
7. Zoom into the editor pane (`Ctrl+a z`), do some work, zoom out
8. Detach (`Ctrl+a d`), reattach (`tmux attach -t project`)

**Checkpoint**: You should be able to set up this entire workspace in under 60 seconds.

---

## Bonus: Useful Commands Reference

| Action                     | Keys / Command                    |
|----------------------------|-----------------------------------|
| New session                | `tmux new -s name`                |
| Detach                     | `Ctrl+a d`                        |
| Attach                     | `tmux attach -t name`             |
| Session list               | `Ctrl+a s`                        |
| New window                 | `Ctrl+a c`                        |
| Rename window              | `Ctrl+a ,`                        |
| Split horizontal           | `Ctrl+a \|`                       |
| Split vertical             | `Ctrl+a -`                        |
| Navigate panes             | `Ctrl+a h/j/k/l`                  |
| Resize panes               | `Ctrl+a H/J/K/L`                  |
| Zoom pane                  | `Ctrl+a z`                        |
| Copy mode                  | `Ctrl+a [`                        |
| Paste                      | `Ctrl+a ]`                        |
| Command prompt             | `Ctrl+a :`                        |
| Reload config              | `Ctrl+a r`                        |
| Kill pane                  | `Ctrl+d`                          |
| Kill session               | `tmux kill-session -t name`       |
