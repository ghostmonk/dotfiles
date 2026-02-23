# SketchyBar Daily Exercises

> SketchyBar is not a hotkey tool -- it's a **programmable status bar**.
> You customize it by running `sketchybar` CLI commands and writing shell script plugins.
> Config lives at `~/.config/sketchybar/sketchybarrc`, plugins in `~/.config/sketchybar/plugins/`.

---

## Day 1: Understanding the Bar

**Goal:** Learn how the bar works and how to talk to it.

1. Make sure sketchybar is running:
   ```bash
   brew services start sketchybar
   ```
2. Look at your bar -- you should see space indicators on the left, a clock/volume/battery on the right
3. Query what's on your bar:
   ```bash
   sketchybar --query bar
   ```
4. List all items currently on the bar:
   ```bash
   sketchybar --query default_menu_items
   ```
5. Query a specific item:
   ```bash
   sketchybar --query clock
   ```

**Challenge:** Run `sketchybar --query bar` and identify which settings match your `sketchybarrc` file.

---

## Day 2: Changing the Bar Appearance

**Goal:** Modify the bar itself in real time.

All changes are live -- you'll see them instantly.

1. Change bar color (ARGB hex format: `0xAARRGGBB`):
   ```bash
   sketchybar --bar color=0xff1e1e2e
   ```
2. Change bar height:
   ```bash
   sketchybar --bar height=35
   ```
3. Add rounded corners and a margin (floating bar look):
   ```bash
   sketchybar --bar corner_radius=10 margin=10 y_offset=5
   ```
4. Add a border:
   ```bash
   sketchybar --bar border_width=2 border_color=0xff89b4fa
   ```
5. Reset to defaults by reloading your config:
   ```bash
   sketchybar --reload
   ```

**Color format:** `0xAARRGGBB` where AA=alpha (ff=opaque, 00=transparent), RR/GG/BB = red/green/blue.

**Challenge:** Make the bar semi-transparent with a blur effect. Hint: `color=0x80000000 blur_radius=30`.

---

## Day 3: Modifying Existing Items

**Goal:** Change what's already on your bar using `--set`.

1. Change the clock icon:
   ```bash
   sketchybar --set clock icon=🕐
   ```
2. Change label color on the clock:
   ```bash
   sketchybar --set clock label.color=0xff89b4fa
   ```
3. Change the font:
   ```bash
   sketchybar --set clock label.font="Hack Nerd Font:Bold:16.0"
   ```
4. Add a background to an item:
   ```bash
   sketchybar --set clock background.color=0x40ffffff background.corner_radius=5 background.height=25
   ```
5. Hide an item:
   ```bash
   sketchybar --set battery drawing=off
   ```
6. Show it again:
   ```bash
   sketchybar --set battery drawing=on
   ```

**Challenge:** Style your front_app item to have a colored background and a different font size.

---

## Day 4: Adding New Items

**Goal:** Add your own custom items to the bar.

1. Add a simple static item:
   ```bash
   sketchybar --add item greeting right \
              --set greeting icon=👋 label="Hello"
   ```
2. Add an item with a script that updates:
   ```bash
   sketchybar --add item ip_address right \
              --set ip_address update_freq=30 \
                    icon=🌐 \
                    script="sketchybar --set ip_address label=\"$(ipconfig getifaddr en0 2>/dev/null || echo 'N/A')\""
   ```
3. Add a center item:
   ```bash
   sketchybar --add item center_label center \
              --set center_label label="$(date '+%A, %B %d')"
   ```
4. Remove an item:
   ```bash
   sketchybar --remove greeting
   ```
5. Reorder items:
   ```bash
   sketchybar --reorder clock volume battery
   ```

**Challenge:** Add an item that shows the currently playing song or your hostname.

---

## Day 5: Events & Scripting

**Goal:** Make items react to system events.

1. Read the front_app plugin to understand how events work:
   ```bash
   cat ~/.config/sketchybar/plugins/front_app.sh
   ```
2. Create a new plugin script:
   ```bash
   cat > ~/.config/sketchybar/plugins/wifi.sh << 'EOF'
   #!/bin/bash
   SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F': ' '/^ *SSID/{print $2}')
   sketchybar --set "$NAME" label="${SSID:-Disconnected}"
   EOF
   chmod +x ~/.config/sketchybar/plugins/wifi.sh
   ```
3. Add the item and subscribe it to an event:
   ```bash
   sketchybar --add item wifi right \
              --set wifi icon=📶 \
                    script="~/.config/sketchybar/plugins/wifi.sh" \
                    update_freq=10
   ```
4. Force all scripts to run:
   ```bash
   sketchybar --update
   ```

**Available system events to subscribe to:**
- `front_app_switched` -- active app changed
- `space_change` -- workspace/space changed
- `volume_change` -- volume adjusted
- `brightness_change` -- brightness adjusted
- `power_source_change` -- plugged in / on battery
- `system_woke` -- Mac woke from sleep
- `display_change` -- display changed
- `media_change` -- music/media changed

**Challenge:** Create a battery plugin that changes its icon based on charge level.

---

## Day 6: Mouse Interaction

**Goal:** Make items clickable and interactive.

1. Add a clickable item:
   ```bash
   sketchybar --add item do_not_disturb right \
              --set do_not_disturb icon=🔔 label="DND" \
                    click_script="sketchybar --set do_not_disturb icon.highlight=toggle"
   ```
2. Subscribe to mouse events:
   ```bash
   sketchybar --add item hover_demo right \
              --set hover_demo icon=◉ label="" \
                    label.drawing=off \
              --subscribe hover_demo mouse.entered mouse.exited
   ```
3. Create a popup-style interaction -- show more info on hover by writing a script that toggles label visibility

**Challenge:** Make your clock item show the full date when clicked, and go back to just the time when clicked again.

---

## Day 7: Building Your Custom Bar

**Goal:** Edit `sketchybarrc` to make your bar permanent.

1. Open your config:
   ```bash
   $EDITOR ~/.config/sketchybar/sketchybarrc
   ```
2. Add anything you liked from the week's exercises into the config file
3. Integrate with AeroSpace -- fix the space click scripts:
   ```bash
   # Replace yabai click_script with aerospace:
   click_script="aerospace workspace $sid"
   ```
4. Reload to test:
   ```bash
   sketchybar --reload
   ```
5. Iterate: change colors, fonts, items, and reload until you're happy

**Challenge:** Build a bar with: workspace indicators (working with AeroSpace), front app name, clock, battery, and volume -- all styled with a consistent color scheme.

---

## Quick Reference

### CLI Commands

| Command | What it does |
|---|---|
| `sketchybar --bar <prop>=<val>` | Change bar appearance |
| `sketchybar --set <item> <prop>=<val>` | Modify an item |
| `sketchybar --add item <name> <position>` | Add new item (left/right/center) |
| `sketchybar --remove <name>` | Remove an item |
| `sketchybar --query <item>` | Inspect an item's properties |
| `sketchybar --query bar` | Inspect bar properties |
| `sketchybar --subscribe <item> <event>` | Subscribe item to events |
| `sketchybar --trigger <event>` | Manually trigger an event |
| `sketchybar --reorder <item> ... <item>` | Reorder items |
| `sketchybar --reload` | Reload config from sketchybarrc |
| `sketchybar --update` | Force all scripts to run |
| `brew services start sketchybar` | Start sketchybar service |
| `brew services restart sketchybar` | Restart sketchybar service |

### Color Format

`0xAARRGGBB` -- example colors:
- `0xff000000` -- solid black
- `0xffffffff` -- solid white
- `0x80000000` -- 50% transparent black
- `0xff89b4fa` -- Catppuccin blue
- `0xffa6e3a1` -- Catppuccin green
- `0xfff38ba8` -- Catppuccin red
- `0x00000000` -- fully transparent

### Item Positions

- `left` -- left side of bar
- `right` -- right side of bar (items stack right-to-left)
- `center` -- center of bar
- `q` -- left of notch (MacBook only)
- `e` -- right of notch (MacBook only)
