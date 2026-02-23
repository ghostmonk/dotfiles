# Neovim Daily Exercises

Work through one day at a time. Practice each day's exercises until they feel automatic before moving on.

---

## Day 1: Movement Basics

**Goal**: Navigate within a file without touching the mouse.

1. Open a file: `nvim ~/.config/nvim/init.lua`
2. Move by character: `h` (left), `j` (down), `k` (up), `l` (right)
3. Move by word: `w` (next word), `b` (back word), `e` (end of word)
4. Move by big word (ignores punctuation): `W`, `B`, `E`
5. Jump to start of line: `0` — first non-blank: `^` — end of line: `$`
6. Jump to top of file: `gg` — bottom of file: `G` — specific line: `42G`
7. Page down: `Ctrl+d` — page up: `Ctrl+u`
8. Center screen on cursor: `zz` — top: `zt` — bottom: `zb`

**Checkpoint**: Open a long file, jump to line 50, scroll to make it the top line, jump to the end of the file, then back to the top. No mouse.

---

## Day 2: Editing Essentials

**Goal**: Insert, delete, change, and undo text confidently.

1. Enter insert mode: `i` (before cursor), `a` (after cursor)
2. Insert at start of line: `I` — append at end of line: `A`
3. Open new line below: `o` — above: `O`
4. Delete character: `x` — delete line: `dd`
5. Delete word: `dw` — delete to end of line: `D`
6. Change word (delete + insert): `cw` — change to end of line: `C`
7. Change entire line: `cc`
8. Undo: `u` — redo: `Ctrl+r`
9. Repeat last action: `.`

**Checkpoint**: Open a file, add 3 lines with `o`, change a word with `cw`, delete a line with `dd`, undo it, redo it, then repeat the delete on another line with `.`

---

## Day 3: Visual Mode & Selections

**Goal**: Select text and operate on it.

1. Enter visual mode (character): `v` — select with movement keys
2. Visual line mode: `V` — selects whole lines
3. Visual block mode: `Ctrl+v` — selects a column/rectangle
4. After selecting, operate: `d` (delete), `y` (yank/copy), `c` (change)
5. Select a word: `viw` — select inside quotes: `vi"` — inside parens: `vi(`
6. Select around (includes delimiters): `va"`, `va(`
7. Indent selection: `>` — unindent: `<`
8. Reselect last visual selection: `gv`

**Checkpoint**: Select a block of 5 lines with `V`, indent them with `>`, reselect with `gv`, and yank them with `y`. Then paste below with `p`.

---

## Day 4: Copy, Paste & Registers

**Goal**: Master yanking, pasting, and using registers.

1. Yank (copy) a line: `yy` — yank a word: `yw`
2. Paste after cursor: `p` — paste before: `P`
3. Yank to system clipboard: `"+y` (in visual mode or with motion)
4. Paste from system clipboard: `"+p`
5. View registers: `:registers`
6. Yank to named register: `"ay` (register 'a') — paste from it: `"ap`
7. Delete to a register: `"bdd` — now `"bp` pastes that deleted line
8. The black hole register (delete without saving): `"_dd`

**Checkpoint**: Yank a line into register `a`, delete a different line into register `b`, then paste both in a new location using `"ap` and `"bp`.

---

## Day 5: Search & Replace

**Goal**: Find text and make substitutions.

1. Search forward: `/pattern` then `Enter`
2. Search backward: `?pattern` then `Enter`
3. Next match: `n` — previous match: `N`
4. Search for word under cursor: `*` (forward) — `#` (backward)
5. Clear search highlight: `:noh`
6. Replace on current line: `:s/old/new/g`
7. Replace in entire file: `:%s/old/new/g`
8. Replace with confirmation: `:%s/old/new/gc` (y/n for each match)
9. Replace only in visual selection: select text, then `:s/old/new/g`

**Checkpoint**: Open a file, search for a common word with `*`, replace all occurrences with `:%s`, then undo the whole thing with `u`.

---

## Day 6: Buffers, Windows & Tabs

**Goal**: Work with multiple files simultaneously.

1. Open a second file: `:e path/to/file`
2. List open buffers: `:ls`
3. Switch buffers: `:bnext` / `:bprev` or `:b <name>`
4. Delete a buffer: `:bd`
5. Split window horizontally: `:split` or `Ctrl+w s`
6. Split window vertically: `:vsplit` or `Ctrl+w v`
7. Navigate windows: `Ctrl+w h/j/k/l`
8. Close a window: `Ctrl+w q`
9. Make current window the only one: `Ctrl+w o`
10. Resize: `Ctrl+w +` (taller), `Ctrl+w -` (shorter), `Ctrl+w =` (equalize)
11. Open a new tab: `:tabnew` — switch: `gt` / `gT`

**Checkpoint**: Open 3 files in splits (1 left, 2 stacked right), navigate between all of them, then close the splits and switch between them as buffers.

---

## Day 7: Text Objects & Motions Combos

**Goal**: Combine verbs + motions for surgical edits.

1. Delete inside parentheses: `di(`
2. Change inside quotes: `ci"`
3. Yank inside brackets: `yi[`
4. Delete around tags: `dat` (HTML tag and its content)
5. Change inside curly braces: `ci{`
6. Delete a paragraph: `dap`
7. Change a sentence: `cas`
8. Yank a function argument: `yi,` (with appropriate text object plugin)
9. Visual-select a whole function block: `Vaf` (with treesitter text objects)

**Checkpoint**: Open a file with nested structures. Use `ci"` to change a string, `di(` to empty a function call's arguments, and `dap` to delete a paragraph. This should feel like precision surgery.

---

## Day 8: Macros

**Goal**: Record and replay repetitive edits.

1. Start recording a macro into register `q`: `qq`
2. Perform your edits (e.g., `I// ` to comment a line, then `j`)
3. Stop recording: `q`
4. Replay the macro: `@q`
5. Replay it again: `@@` (repeats last macro)
6. Replay 10 times: `10@q`
7. Apply macro to visual selection: select lines with `V`, then `:normal @q`

**Checkpoint**: Create a list of 10 words on separate lines. Record a macro that wraps each line in quotes and adds a comma. Apply it to all 10 lines in one command.

---

## Day 9: Marks & Jumps

**Goal**: Set bookmarks and navigate jump history.

1. Set a mark: `ma` (mark 'a' at current position)
2. Jump to mark: `'a` (line) or `` `a `` (exact position)
3. List marks: `:marks`
4. Jump to last edit location: `` `. ``
5. Jump to position before last jump: `` `` `` (backtick backtick)
6. Jump back in jump list: `Ctrl+o`
7. Jump forward in jump list: `Ctrl+i`
8. View the jump list: `:jumps`

**Checkpoint**: Open a long file, set 3 marks (`ma`, `mb`, `mc`) at different spots. Jump between them. Then use `Ctrl+o` and `Ctrl+i` to navigate your jump history.

---

## Day 10: Telescope (Fuzzy Finding)

**Goal**: Find files, text, and navigate your project fast.

1. Find files: `:Telescope find_files` (set a keymap like `<leader>ff`)
2. Live grep (search text across project): `:Telescope live_grep` (`<leader>fg`)
3. Search open buffers: `:Telescope buffers` (`<leader>fb`)
4. Search help tags: `:Telescope help_tags` (`<leader>fh`)
5. Resume last search: `:Telescope resume`
6. Inside Telescope: type to filter, `Ctrl+n/p` to move, `Enter` to open
7. Open in split: `Ctrl+x` — open in vsplit: `Ctrl+v`
8. Grep for word under cursor: `:Telescope grep_string`

**Checkpoint**: Use find_files to open a file, then live_grep to search for a function name, open the result in a vertical split.

---

## Day 11: LSP (Language Server)

**Goal**: Use code intelligence — go to definition, completions, diagnostics.

1. Go to definition: `gd`
2. Go to declaration: `gD`
3. Hover info (docs): `K`
4. Signature help (in insert mode): `Ctrl+k`
5. Show references: `gr`
6. Rename symbol: `:lua vim.lsp.buf.rename()`
7. Code action (quick fix): `:lua vim.lsp.buf.code_action()`
8. Show diagnostics on line: `:lua vim.diagnostic.open_float()`
9. Jump to next diagnostic: `]d` — previous: `[d`
10. List all diagnostics: `:Telescope diagnostics`
11. Format buffer: `:lua vim.lsp.buf.format()`

**Checkpoint**: Open a TypeScript or Python file, hover a function with `K`, jump to its definition with `gd`, find all references with `gr`, and rename a variable.

---

## Day 12: File Explorer & Oil

**Goal**: Browse and manipulate files from inside Neovim.

1. Open nvim-tree: `:NvimTreeToggle` (set a keymap like `<leader>e`)
2. Navigate: `j/k`, open file: `Enter`, open in split: `Ctrl+x`
3. Create file: `a` — rename: `r` — delete: `d`
4. Open Oil (buffer-based file explorer): `:Oil`
5. In Oil: navigate like a normal buffer, rename by editing text
6. Create a file: just type a new filename on a new line
7. Delete: remove the line and save
8. Open parent directory: `-`
9. Save changes (creates/renames/deletes): `:w`

**Checkpoint**: Use Oil to create a new directory and file, rename a file, and delete another — all by editing the buffer and saving.

---

## Day 13: Completion & Snippets

**Goal**: Use nvim-cmp and LuaSnip effectively.

1. Trigger completion menu: start typing, or `Ctrl+Space` to force it
2. Navigate the menu: `Ctrl+n` (next), `Ctrl+p` (previous)
3. Accept completion: `Enter`
4. Dismiss menu: `Ctrl+e`
5. Sources appear with labels: LSP, Buffer, Path, Snippet
6. Expand a snippet: select it from completion and press `Enter`
7. Jump to next snippet placeholder: `Tab` (if configured) or `Ctrl+l`
8. Jump to previous placeholder: `Shift+Tab` or `Ctrl+h`

**Checkpoint**: Open a JS file, trigger completion for `console.`, select `log`, expand it, fill in the placeholders.

---

## Day 14: Putting It All Together

**Goal**: Simulate a real editing workflow using everything you've learned.

1. Open your project root: `nvim .`
2. Use Telescope to find a file (`<leader>ff`)
3. Jump to a function definition with `gd`
4. Read the docs with `K`
5. Set a mark at this location: `ma`
6. Use Telescope live_grep to find where this function is called
7. Make edits using text objects (`ci"`, `di(`)
8. Jump back to your mark: `'a`
9. Record a macro for a repetitive edit and apply it
10. Use `:w` to save, `:bd` to close the buffer, move on to the next file

**Checkpoint**: You should be able to navigate, search, edit, and manage files without ever touching the mouse. Time yourself — try to do this workflow in under 3 minutes.

---

## Bonus: Essential Keybindings Reference

| Action                        | Keys                              |
|-------------------------------|-----------------------------------|
| Save                          | `:w`                              |
| Quit                          | `:q`                              |
| Save and quit                 | `:wq` or `ZZ`                     |
| Quit without saving           | `:q!`                             |
| Undo / Redo                   | `u` / `Ctrl+r`                    |
| Repeat last change            | `.`                               |
| Search forward / backward     | `/` / `?`                         |
| Next / prev search match      | `n` / `N`                         |
| Word under cursor search      | `*` / `#`                         |
| Go to definition              | `gd`                              |
| Hover docs                    | `K`                               |
| Find references               | `gr`                              |
| Open file explorer            | `:NvimTreeToggle`                 |
| Fuzzy find files              | `:Telescope find_files`           |
| Grep project                  | `:Telescope live_grep`            |
| Split vertical / horizontal   | `Ctrl+w v` / `Ctrl+w s`          |
| Navigate windows              | `Ctrl+w h/j/k/l`                 |
| Close window                  | `Ctrl+w q`                        |
| Next / prev buffer            | `:bnext` / `:bprev`              |
| Delete buffer                 | `:bd`                             |
| Indent / unindent (visual)    | `>` / `<`                         |
| Comment toggle                | `gcc` (line) / `gc` (selection)   |
| Record macro / stop           | `qq` / `q`                        |
| Play macro                    | `@q` / `@@`                       |
| Jump back / forward           | `Ctrl+o` / `Ctrl+i`              |
| System clipboard copy         | `"+y`                             |
| System clipboard paste        | `"+p`                             |
