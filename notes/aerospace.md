# AeroSpace Daily Exercises

> **Key reminder:** `alt` in AeroSpace config = the **Option (⌥)** key on your Mac.
> **Workspaces:** A, S, D, F (Dell) paired with 1, 2, 3, 4 (LG)
> **Monitors:** Dell P2721Q (primary) + LG HDR 4K (secondary)

---

## Day 1: Focus & Navigation

**Goal:** Stop reaching for your mouse to switch between windows.

1. Open 3 apps (e.g. Terminal, browser, editor)
2. Practice moving focus between them:
   - `⌥ + h` focus left (crosses monitor boundaries)
   - `⌥ + l` focus right (crosses monitor boundaries)
   - `⌥ + j` focus down
   - `⌥ + k` focus up
3. Keep doing this until you can reliably land on the window you want
4. Notice how the focus follows a spatial pattern -- windows that are physically to the left/right/above/below
5. `⌥ + h/l` will move focus across monitors -- try jumping from a window on the Dell to one on the LG

**Challenge:** Go 30 minutes without clicking a window to focus it. Use only `⌥ + h/j/k/l`, including across both monitors.

---

## Day 2: Moving Windows

**Goal:** Rearrange your layout without dragging.

1. Open 3 windows in a workspace
2. Move the focused window around:
   - `⌥ + shift + h` move left
   - `⌥ + shift + l` move right
   - `⌥ + shift + j` move down
   - `⌥ + shift + k` move up
3. Try to get a specific arrangement: e.g. terminal on the left, browser top-right, editor bottom-right
4. Use `⌥ + /` to toggle between horizontal and vertical tiling

**Challenge:** Set up a 3-window layout (one big left, two stacked right) using only keyboard commands.

---

## Day 3: Paired Workspaces (Dual Monitor)

**Goal:** Use paired workspaces across both monitors.

Your setup uses paired workspaces -- each keypress switches both monitors:
- `⌥ + a` → Dell shows **A**, LG shows **1**
- `⌥ + s` → Dell shows **S**, LG shows **2**
- `⌥ + d` → Dell shows **D**, LG shows **3**
- `⌥ + f` → Dell shows **F**, LG shows **4**

1. Press `⌥ + a` -- both monitors switch to the A/1 pair
2. Open a terminal on the Dell, open a browser on the LG (`⌥ + l` to focus LG first)
3. Press `⌥ + s` -- both monitors switch to S/2 (your previous windows disappear together)
4. Press `⌥ + a` -- they're back, both monitors at once
5. Send a window from the Dell to the LG: `⌥ + shift + 1`
6. Send a window from the LG to the Dell: `⌥ + shift + a`
7. Use `⌥ + tab` to bounce between your last two workspace pairs

**Challenge:** Set up your 4 workspace pairs for different contexts:
- A/1: terminal/coding (Dell: editor, LG: terminal/docs)
- S/2: browser/research (Dell: primary browser, LG: reference)
- D/3: chat/communication (Dell: Slack, LG: email)
- F/4: music/misc

---

## Day 4: Resizing

**Goal:** Control how much space each window gets.

1. Open 2 windows side by side
2. Focus the one you want bigger
3. Resize:
   - `⌥ + =` make it bigger
   - `⌥ + -` make it smaller
4. Keep pressing to adjust to your liking
5. Try with 3 windows and get the middle one to take up half the screen

**Challenge:** Create a layout with a wide main editor (60%) and a narrow terminal sidebar (40%).

---

## Day 5: Layout Modes

**Goal:** Understand tiles vs accordion.

1. Open 4 windows in one workspace
2. They should tile automatically -- notice how they split the space
3. Press `⌥ + ,` to switch to accordion mode
4. Now windows are stacked -- use `⌥ + h/l` or `⌥ + j/k` to cycle through them
5. Notice the padding on the edges hinting at hidden windows
6. Press `⌥ + /` to go back to tiles

**When to use each:**
- **Tiles** = you want to see multiple windows at once (coding + terminal + docs)
- **Accordion** = you want one window fullscreen-ish but quick switching (browsing tabs, reading docs)

**Challenge:** Put your browser workspace (S) in accordion mode and your coding workspace (A) in tiles.

---

## Day 6: Service Mode & Floating

**Goal:** Learn the secondary command mode.

1. Enter service mode: `⌥ + shift + ;`
   - Your keybindings now change! Only service mode bindings work
2. Try these (each one returns you to main mode automatically):
   - `f` -- toggle current window between floating and tiling
   - `r` -- reset/flatten workspace layout (fixes weird nesting)
   - `backspace` -- close all windows except current
   - `esc` -- reload config and go back to main mode
3. If you ever edit `~/.aerospace.toml`, enter service mode and press `esc` to reload

**Challenge:** Float a window (sticky note style), move it with your mouse, then press `⌥ + shift + ;` then `f` to tile it back in.

---

## Day 7: Putting It All Together

**Goal:** Full keyboard-driven workflow for an entire work session.

Morning routine:
1. Open AeroSpace (it should auto-start)
2. `⌥ + a` -- set up coding pair (Dell: editor, LG: terminal/docs)
3. `⌥ + s` -- set up research pair (Dell: browser, LG: reference)
4. `⌥ + d` -- set up comms pair (Dell: Slack, LG: email)
5. `⌥ + f` -- set up misc pair (Dell: music, LG: notes)

Working:
1. `⌥ + a` to jump to code -- both monitors switch together
2. `⌥ + h/l` to move focus between Dell and LG
3. `⌥ + /` to toggle split direction as needed
4. `⌥ + =` / `⌥ + -` to resize
5. `⌥ + s` to check browser (both monitors switch), `⌥ + tab` to jump back
6. `⌥ + shift + 1` to send a Dell window to the LG side
7. `⌥ + shift + a` to send an LG window to the Dell side

**Challenge:** Go an entire work session without using your mouse to manage windows. Track how many times you slip up.

---

## Quick Reference Card

| Action                         | Keys                  |
|--------------------------------|-----------------------|
| Focus left/right (across monitors) | `⌥ + h/l`       |
| Focus down/up                  | `⌥ + j/k`            |
| Move window left/down/up/right | `⌥ + shift + h/j/k/l`|
| Switch workspace pair (both monitors) | `⌥ + a/s/d/f` |
| Send window to Dell workspace  | `⌥ + shift + a/s/d/f`|
| Send window to LG workspace   | `⌥ + shift + 1/2/3/4`|
| Last workspace pair            | `⌥ + tab`            |
| Move workspace to next monitor | `⌥ + shift + tab`    |
| Toggle tile split direction    | `⌥ + /`              |
| Toggle accordion               | `⌥ + ,`              |
| Grow window                    | `⌥ + =`              |
| Shrink window                  | `⌥ + -`              |
| Enter service mode             | `⌥ + shift + ;`      |
| (service) Reload config        | `esc`                 |
| (service) Toggle floating      | `f`                   |
| (service) Reset layout         | `r`                   |
| (service) Close other windows  | `backspace`           |

## Workspace Pairing Map

| Pair | Dell (primary) | LG (secondary) | Shortcut    |
|------|----------------|----------------|-------------|
| 1    | A              | 1              | `⌥ + a`     |
| 2    | S              | 2              | `⌥ + s`     |
| 3    | D              | 3              | `⌥ + d`     |
| 4    | F              | 4              | `⌥ + f`     |
