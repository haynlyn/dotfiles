# Neovim Configuration

Leader key: `<Space>`
Local leader: `\`

## Keybindings

### Navigation & Windows

| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to window below |
| `Ctrl+k` | Move to window above |
| `Ctrl+l` | Move to right window |
| `Ctrl+c` | Close current window |
| `Alt+h` | Resize window left |
| `Alt+j` | Resize window down |
| `Alt+k` | Resize window up |
| `Alt+l` | Resize window right |
| `Ctrl+d` | Scroll down (cursor centered) |
| `Ctrl+u` | Scroll up (cursor centered) |
| `<Esc>` | Clear search highlights |

### File Explorer & Search

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree file explorer |
| `-` | Open parent directory (Oil) |
| `<leader>f` | Find files (Telescope) |
| `<leader>g` | Live grep (Telescope) |
| `<leader>b` | List buffers (Telescope) |
| `<leader>h` | Help tags (Telescope) |
| `<leader>i` | Import search (Telescope) |
| `<leader>j` | Jumplist (Telescope) |

### LSP & Diagnostics

| Key | Action |
|-----|--------|
| `K` | Hover documentation (built-in) |
| `gd` | Go to definition |
| `gr` | Go to references (all usages) |
| `gy` | Go to type definition |
| `Ctrl+o` | Jump back (after gd/gr/gy) |
| `Ctrl+i` | Jump forward |
| `[f` | Jump to previous file in jumplist |
| `]f` | Jump to next file in jumplist |
| `<leader>rn` | Rename symbol across files |
| `<leader>ca` | Code actions (quick fixes, refactors) |
| `<leader>d` | Show diagnostic popup (hover error) |
| `<leader>q` | Send diagnostics to quickfix list |
| `]d` | Jump to next diagnostic |
| `[d` | Jump to previous diagnostic |
| `<leader>xx` | Toggle Trouble (all diagnostics) |
| `<leader>xd` | Toggle Trouble (buffer diagnostics) |

### Plugin Management

| Key | Action |
|-----|--------|
| `<leader>s` | Lazy sync (update & reload plugins) |

### Theme

| Key | Action |
|-----|--------|
| `<leader>tb` | Toggle transparent background |

### Git (LazyGit & Gitsigns)

#### LazyGit

| Key | Action |
|-----|--------|
| `<leader>lg` | Open LazyGit |

#### Gitsigns - Navigation

| Key | Action |
|-----|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |

#### Gitsigns - Hunk Actions

| Key | Mode | Action |
|-----|------|--------|
| `<leader>Hs` | Normal/Visual | Stage hunk |
| `<leader>Hr` | Normal/Visual | Reset hunk |
| `<leader>Hu` | Normal | Undo stage hunk |
| `<leader>Hp` | Normal | Preview hunk |

#### Gitsigns - Buffer Actions

| Key | Action |
|-----|--------|
| `<leader>GS` | Stage entire buffer |
| `<leader>GR` | Reset entire buffer |

#### Gitsigns - Blame & Diff

| Key | Action |
|-----|--------|
| `<leader>Gb` | Toggle inline git blame (virtual text) |
| `<leader>GB` | Git blame (full commit popup) |
| `<leader>Gd` | Diff this file |
| `<leader>Gt` | Toggle deleted lines |

#### Gitsigns - Text Objects

| Key | Action |
|-----|--------|
| `ih` | Select hunt (operator/visual mode) |

### COmmenting (Comment.nvim)

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment (line) |
| `gc{motion}` | Toggle comment (motion) |
| `gbc` | Toggle block comment (line) |
| `gc` (visual)| Toggle comment (selection) |

### Undo History

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undotree |

### Code Formatting

| Key | Action |
|-----|--------|
| `<leader>cf` | Format buffer |

Auto-format on save is enabled for: `markdown`, `python`

**Note:** `json` has `jq` configured as a formatter but is not auto-formatted on save. Use `<leader>cf` to format manually.

### Clipboard (System)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>y` | Normal/Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank to end of line to system clipboard |
| `<leader>p` | Normal/Visual | Paste from system clipboard |
| `<leader>P` | Normal/Visual | Paste before from system clipboard |

### Text Objects (Treesitter)

| Key | Action |
|-----|--------|
| `af` | Select around function |
| `if` | Select inside function |
| `ac` | Select around class |
| `ic` | Select inside class |

### Surround (nvim-surround)

| Key | Action | Example |
|-----|--------|---------|
| `gs{motion}{char}` | Add surround | `gsiw"` → surround word with `"` |
| `gss{char}` | Surround entire line | `gss)` → wrap line in `()` |
| `cs{old}{new}` | Change surround | `cs"'` → change `"` to `'` |
| `ds{char}` | Delete surround | `ds"` → delete surrounding `"` |
| `S{char}` (visual) | Surround selection | Select text, `S]` → wrap in `[]` |

**Note:** The default nvim-surround keymaps (`ys`/`yss`) are disabled in favour of `gs`/`gss`.

Characters: `"`, `'`, `)`, `]`, `}`, `` ` ``, `t` (HTML tag)

## Installed Plugins

- **gitsigns.nvim** - Git integration and hunk management
- **lazygit.nvim** - Terminal UI for git
- **autoclose.nvim** - Auto-close brackets/quotes
- **blink.cmp** - Fast autocompletion
- **Comment.nvim** - Toggle comments with gcc
- **mason.nvim** - LSP/DAP/Linter/Formatter installer
- **nvim-surround** - Add/change/delete surroundings
- **nvim-ts-autotag** - Auto-close HTML/JSX tags
- **telescope.nvim** - Fuzzy finder
- **undotree** - Visual undo history
- **which-key.nvim** - Shows available keybindings
- **neo-tree.nvim** - File explorer sidebar
- **oil.nvim** - Edit filesystem like a buffer
- **treesitter** - Syntax highlighting and text objects
- **conform.nvim** - Code formatting
- **smart-splits.nvim** - Window navigation and resizing
- **trouble.nvim** - Diagnostics list
- **catppuccin** - Color scheme
- **fidget.nvim** - LSP progress indicator
- **nvim-notify** - Notification UI
- **tint.nvim** - Dim inactive windows

### Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `Tab` | Accept completion / Next item (in snippet) |
| `Shift+Tab` | Previous item (in snippet) |
| `Ctrl+Space` | Trigger completion |
| `Ctrl+e` | Cancel completion |
| `Ctrl+b` / `Ctrl+f` | Scroll docs up/down |

## LSP Servers

Configured via Mason and native `vim.lsp.config` (Neovim 0.11+):

| Language | Server |
|----------|--------|
| Rust | rust_analyzer |
| Lua | lua_ls |
| JavaScript/TypeScript | eslint |
| Python | ty (type checking), ruff (linting) |

**Note:** `ty` sometimes returns multiple definitions (class + constructor). The `gd` keymap auto-jumps to the first result as a workaround. Check [ty documentation](https://github.com/astral-sh/ty) for configuration options to change this behavior.

**Note:** Python LSPs (pyright, ty, ruff) require a `pyproject.toml` in your project root to resolve local imports. Without it, you'll get false errors on imports and no autocomplete for local modules. Minimal example:

```toml
[project]
name = "my_project"
version = "0.1.0"
```

## Tips

- Use `:LspInfo` to check LSP status for current buffer
- Use `:Mason` to manage LSP servers
- Use `:ConformInfo` to check formatter status
- Use `:Telescope keymaps` to search all keybindings
