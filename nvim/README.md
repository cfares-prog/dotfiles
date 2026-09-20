# nvim-config

A fully customized Neovim configuration

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Configuration Modules](#configuration-modules)
- [Key Bindings](#key-bindings)
- [Plugin Configuration](#plugin-configuration)
- [Color Schemes](#color-schemes)
- [Language Server Setup](#language-server-setup)
- [Customization](#customization)

## Overview

This is a complete Neovim configuration leveraging **Lazy.nvim** for fast plugin management and loading. The configuration is organized into modular Lua components for easy maintenance and customization. It includes modern development tools, comprehensive LSP support, and a polished user interface.


## Features

✨ **Core Features:**
- ⚡ Lazy plugin loading with `lazy.nvim`
- 🎨 Multiple color scheme options (Koda, Catppuccin, Rose Pine, Gruber Darker)
- 📋 Indent guides with `indent-blankline.nvim`
- 🎯 Fuzzy finding with `fzf-lua`
- 📁 File explorer with `oil.nvim`
- 💬 LSP support with multiple language servers
- 🔧 Intelligent completion with `blink.cmp`
- 🌳 Syntax highlighting with Treesitter
- 📊 Status line with `lualine.nvim`
- 🗄️ Database integration with `vim-dadbod`
- 📝 Snippet support with `friendly-snippets`
- 🦀 Rust development support with `rustaceanvim`
- 🔗 C# development support with `roslyn.nvim`
- 🎯 Diagnostic floating windows with rounded borders
- 🎨 Custom syntax highlighting and color configuration

## Project Structure

```
nvim-config/
├── init.lua                          # Main entry point
├── lazy-lock.json                    # Plugin lock file
├── lua/
│   └── faust/
│       ├── init.lua                  # Lualine status bar configuration
│       ├── lazy.lua                  # Lazy.nvim bootstrap and setup
│       ├── lsp.lua                   # LSP configuration and Mason setup
│       ├── remap.lua                 # Custom key mappings
│       ├── set.lua                   # Vim options, UI customization, and Oil file explorer
│       └── plugins/
│           ├── blankline.lua         # Indent guides configuration
│           ├── blink.lua             # Blink completion engine setup
│           ├── fzf.lua               # Fuzzy finder configuration
│           ├── fzf_oil.lua           # FZF + Oil integration
│           ├── lsp.lua               # LSP plugin specifications
│           ├── lualine.lua           # Status line plugin spec
│           ├── mason.lua             # Mason package manager setup
│           ├── oil.lua               # File explorer configuration
│           ├── roslyn.lua            # C# LSP configuration
│           ├── rusteacean.lua        # Rust tools configuration
│           ├── treesitter.lua        # Treesitter setup
│           ├── web_devicons.lua      # File icons setup
│           └── colors/
│               ├── catpuccin.lua     # Catppuccin color scheme
│               ├── colors.lua        # Generic color plugin specs
│               ├── gurbber_darker.lua # Gruber Darker theme
│               ├── koda.lua          # Koda color scheme
│               └── rosepine.lua      # Rose Pine color scheme
├── after/                            # After plugin directory (empty)
└── colors/                           # Custom color schemes directory (empty)
```

## Installation

### Prerequisites

- Neovim 0.9+ (built with Lua support)
- Git
- Node.js (optional, for some LSP servers)
- Python 3 (optional, for Python LSP)
- Rust toolchain (optional, for Rust development)

### Steps

1. **Clone the repository to your Neovim config directory:**

   ```bash
   git clone https://github.com/cfares-prog/nvim-config ~/.config/nvim
   ```

2. **Install/Update plugins:**

   Launch Neovim and run:
   ```vim
   :Lazy sync
   ```

3. **Install language servers (optional):**

   Open Neovim and run:
   ```vim
   :Mason
   ```

   Then select and install the desired language servers.

## Dependencies

### Core Dependencies

| Package | Type | Purpose |
|---------|------|---------|
| `lazy.nvim` | Plugin Manager | Fast and feature-rich plugin manager |
| `nvim-lspconfig` | LSP | Language Server Protocol client configuration |
| `mason.nvim` | Tool Manager | Easy installation of LSP servers, linters, and formatters |
| `nvim-treesitter` | Parser | Syntax highlighting and code understanding |

### UI & Visual Enhancements

| Package | Type | Purpose |
|---------|------|---------|
| `lualine.nvim` | Status Bar | Fast and customizable status line |
| `indent-blankline.nvim` | Visual Aid | Indent level guides |
| `nvim-web-devicons` | Icons | File type icons in UI |
| `mini.icons` | Icons | Fallback icon support |

### Editor Features

| Package | Type | Purpose |
|---------|------|---------|
| `blink.cmp` | Completion | Fast and powerful completion engine |
| `friendly-snippets` | Snippets | Pre-configured code snippets |
| `fzf-lua` | Fuzzy Finder | Fast fuzzy file/content finding |
| `oil.nvim` | File Explorer | Intuitive file explorer |
| `fzf-oil.nvim` | Integration | FZF integration with Oil file explorer |

### Language-Specific Support

| Package | Type | Purpose |
|---------|------|---------|
| `rustaceanvim` | Language Tool | Rust development tools and LSP integration |
| `roslyn.nvim` | Language Tool | C# development with Roslyn LSP |
| `vim-dadbod` | Database Tool | Database connection and interaction |
| `vim-dadbod-ui` | UI | UI for vim-dadbod |
| `vim-dadbod-completion` | Completion | SQL completion for dadbod |

### LSP Servers (Configured)

The following LSP servers are configured in `lua/faust/lsp.lua`:

- **clangd** - C/C++ support
- **pyright** - Python support
- **lua_ls** - Lua support
- **ts_ls** - TypeScript/JavaScript support
- **roslyn** - C# support

### Color Schemes

| Package | Type | Purpose |
|---------|------|---------|
| `catppuccin` | Theme | Catppuccin color scheme |
| `koda.nvim` | Theme | Koda dark color scheme |
| `rose-pine` | Theme | Rose Pine color scheme |
| `gruber-darker.nvim` | Theme | Gruber Darker color scheme |

### Development Utilities

| Package | Type | Purpose |
|---------|------|---------|
| `lazydev.nvim` | Dev Tool | Lua development utilities for Neovim API |

## Configuration Modules

### `init.lua` - Main Entry Point

The primary initialization file that:
- Loads all configuration modules in order
- Sets up terminal GUI colors
- Configures indent-blankline
- Sets up custom hover/diagnostic key binding
- Applies color scheme (Koda Dark by default)
- Installs Treesitter parsers for common languages
- Adds EOF padding with virtual lines

### `lazy.lua` - Plugin Manager Bootstrap

Handles:
- Lazy.nvim bootstrap and installation
- Leader key configuration (space as leader)
- Plugin specification imports from `faust.plugins`
- Plugin lazy loading setup

### `lsp.lua` - Language Server Configuration

Configures:
- LSP server enabling for clangd, pyright, lua_ls, ts_ls
- Mason package manager with custom registries
- Roslyn (C#) LSP configuration
- Language server auto-enabling

### `remap.lua` - Key Mappings

Custom keybindings:
- `<Leader>pv` - Open Vim's built-in file explorer
- `v + J/K` - Move visual selection up/down with auto-indent
- `<C-d>/<C-u>` - Scroll with cursor centering
- `Q` - Disabled (noop)

### `set.lua` - Vim Options & UI Customization

Configures:
- **Editor Settings:**
  - Absolute and relative line numbers
  - Tab settings (4 spaces)
  - No line wrapping
  - Search options (incremental, no highlight)
  - Scroll offset and column highlighting
  - Update time for responsiveness
  
- **Visual Customization:**
  - Color column at 80 characters
  - Custom syntax highlighting colors
  - Comment highlighting (gold, not italic)
  - String highlighting (green)
  - Type/Keyword highlighting (yellow, bold)
  - Identifier and number highlighting
  
- **Plugin Configuration:**
  - Oil file explorer with hidden files visibility
  - File permissions and modification time display
  - Oil keybinding: `-` to open parent directory
  - System clipboard integration
  - Diagnostic configuration with custom formatting and styling

## Key Bindings

| Binding | Mode | Action |
|---------|------|--------|
| `<Space>pv` | Normal | Open file explorer |
| `<C-d>` | Normal | Scroll down with cursor centered |
| `<C-u>` | Normal | Scroll up with cursor centered |
| `J` | Visual | Move selection down with re-indent |
| `K` | Visual | Move selection up with re-indent |
| `K` | Normal | Show hover or diagnostic (custom) |
| `-` | Normal | Open Oil file explorer |
| `Q` | Normal | Disabled (noop) |

## Plugin Configuration

### Lualine (Status Bar)

Located in `lua/faust/init.lua`, configured with:
- Mode indicator
- Git branch and diff information
- Current filename
- Encoding and file format
- File type
- Progress and location
- Nerd Font icons and separators
- High refresh rate (~60fps)

### Blink.cmp (Completion Engine)

Located in `lua/faust/plugins/blink.lua`, features:
- Fast fuzzy matching
- Snippet integration via friendly-snippets
- LSP completion source
- Buffer and path completion
- Custom preselect and highlight behavior
- Fuzzy fuzzy matching mode

### FZF-Lua (Fuzzy Finder)

Located in `lua/faust/plugins/fzf.lua`:
- Fast fuzzy file searching
- Content searching
- Command palette
- Keymaps browser
- Integrated with Oil file explorer

### Oil.nvim (File Explorer)

Configured in `lua/faust/set.lua` with:
- Hidden files visible by default
- File permissions display
- File size and modification time columns
- `-` key to open parent directory

### Treesitter

Auto-installs parsers for:
- Rust
- JavaScript
- C
- Python
- C++
- TypeScript

### Indent-Blankline

Displays vertical indent guides to visualize code structure and improve readability.

### Mason

Language server and tool installer with:
- GitHub official registry
- Crashdummyy custom registry for additional tools

### Rustaceanvim

Rust development support with:
- Rust-analyzer LSP integration
- Cargo integration
- Inlay hints configuration

### Roslyn.nvim

C# development support through the Roslyn language server.

## Color Schemes

The configuration includes support for multiple color schemes. The default is **Koda Dark**:

```lua
vim.cmd.colorscheme("koda-dark")
```

Available schemes (defined in `lua/faust/plugins/colors/`):
- **Koda** - Dark, modern aesthetic
- **Catppuccin** - Popular, pastel color scheme
- **Rose Pine** - Soho vibes color scheme
- **Gruber Darker** - High contrast dark theme

To switch color schemes, edit the `vim.cmd.colorscheme()` line in `init.lua` or use `:colorscheme <name>`.

## Language Server Setup

### Supported Languages

The configuration has built-in support for:

1. **Rust** - via rustaceanvim and rust-analyzer
2. **Python** - via pyright
3. **TypeScript/JavaScript** - via ts_ls
4. **C/C++** - via clangd
5. **Lua** - via lua_ls
6. **C#** - via roslyn

### Installing Language Servers

After launching Neovim, use Mason to install servers:

```vim
:Mason
```

Navigate to desired servers and press `i` to install.

Alternatively, use commands like:
```vim
:MasonInstall pyright rust-analyzer clangd
```

## Customization

### Adding Custom Keybindings

Edit `lua/faust/remap.lua`:

```lua
vim.keymap.set("n", "<Leader>key", function() 
  -- Your custom action
end, { desc = "Description" })
```

### Modifying Editor Options

Edit `lua/faust/set.lua` to adjust:
- Tab width: `vim.opt.tabstop = 4`
- Line numbers: `vim.opt.number = true`
- Color column: `vim.opt.colorcolumn = "80"`

### Adding New Plugins

1. Create a new file in `lua/faust/plugins/` (or `lua/faust/plugins/colors/` for color schemes)
2. Define plugin specification using Lazy.nvim format
3. Plugins are automatically loaded via the import system in `lazy.lua`

Example plugin file:
```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin").setup({
      option = "value"
    })
  end
}
```

### Changing the Color Scheme

Edit `init.lua` and change the colorscheme line:
```lua
vim.cmd.colorscheme("rose-pine")  -- or catppuccin, gruber-darker, koda-dark
```

### Custom Syntax Highlighting

Modify the highlight groups in `lua/faust/set.lua`:

```lua
vim.api.nvim_set_hl(0, "Comment", { fg = "#comment_color", italic = false })
```

## Performance Tips

1. **Lazy Loading**: Plugins are lazy-loaded by default for faster startup
2. **Treesitter Parsers**: Only the essential parsers are auto-installed
3. **LSP Diagnostics**: Configure virtual text and update timing in `set.lua`
4. **Status Line**: Refresh rate is optimized at ~60fps

## Troubleshooting

### Plugins not loading
- Run `:Lazy sync` to ensure all plugins are installed
- Check `lazy-lock.json` for correct commits

### Language servers not working
- Run `:LspInfo` to check LSP status
- Use `:Mason` to install missing servers
- Check `:e $NVIM_LOG_FILE` for error messages

### Color scheme not applying
- Verify color scheme name in `:colorscheme` command
- Ensure `lazy.nvim` is loaded before setting color scheme
- Check that the color scheme plugin is installed

### Treesitter parsing issues
- Run `:TSUpdate` to update all parsers
- Run `:TSInstall language_name` to install specific parsers

## Dependencies Summary

**Total Plugins: 24**

- **1** Plugin Manager (lazy.nvim)
- **4** Core Development (LSP, Treesitter, Mason, lazydev)
- **6** UI Enhancements (lualine, indent-blankline, web-devicons, mini.icons)
- **5** Editor Features (blink.cmp, friendly-snippets, fzf-lua, oil, fzf-oil)
- **3** Language Tools (rustaceanvim, roslyn, dadbod suite)
- **4** Color Schemes (catppuccin, koda, rose-pine, gruber-darker)

## License

This configuration is provided as-is for personal use.

## Contributing

Feel free to fork and customize! This is a personal config, but you're welcome to adapt it for your own use.

---

**Last Updated:** August 2026

For more information about Neovim configuration, visit:
- [Neovim Official Docs](https://neovim.io/doc/user/)
- [Lazy.nvim Repository](https://github.com/folke/lazy.nvim)
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
