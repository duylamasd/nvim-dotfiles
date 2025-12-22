# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on LazyVim with custom plugins and keybindings. The configuration uses lazy.nvim as the plugin manager.

## Architecture

- `init.lua` - Entry point, loads `config.lazy`
- `lua/config/` - Core configuration
  - `lazy.lua` - Plugin manager setup and LazyVim base imports
  - `options.lua` - Vim options and settings
  - `keymaps.lua` - Custom key mappings
  - `autocmds.lua` - Autocommands (currently empty)
- `lua/plugins/` - Plugin configurations (each file returns a lazy.nvim plugin spec)
- `lua/utils/` - Utility modules (e.g., `lsp-on-attach.lua` for LSP keybindings)

## Key Configuration Details

**LazyVim Extras enabled:**
- `ai.claudecode` - Claude Code integration
- `coding.blink` - Blink completion
- `dap.core` - Debug Adapter Protocol
- `editor.mini-files` - File browser
- `editor.mini-move` - Move selections
- `ui.mini-starter` - Start screen

**Picker:** Telescope (set via `vim.g.lazyvim_picker = "telescope"`)

**Colorscheme:** tokyonight

## Custom Keybindings

| Key | Action |
|-----|--------|
| `ff` | Find files |
| `ffh` | Find files (hidden) |
| `ffi` | Find files (no ignore) |
| `fg` | Live grep |
| `fb` | Buffers |
| `fh` | Help tags |
| `gc` | Git commits |
| `gbc` | Git buffer commits |
| `gbr` | Git branches |
| `ts` | Treesitter symbols |
| `<space>f` | Format buffer |
| `<leader>H` | Add file to Harpoon |
| `<leader>h` | Harpoon quick menu |
| `<leader>1-5` | Jump to Harpoon file 1-5 |
| `bn/bp/bd` | Buffer next/prev/delete |
| `nh` | Clear search highlight |

## Formatting & Linting

**Formatters (conform.nvim):**
- Lua: stylua
- JS/TS/React: prettierd, prettier, deno_fmt
- Go: gofmt, goimports
- Python: isort, black
- Rust: rustfmt
- C/C++: clang-format
- Proto: buf

**Linters (nvim-lint):**
- Go: golangcilint
- Python: flake8
- C++: cpplint
- Terraform: tflint

## Plugin Management

Update plugins lock file:
```
:Lazy update
```

The `lazy-lock.json` tracks exact plugin versions.

## AI Integration

- Claude Code via LazyVim extra (`ai.claudecode`)
- codecompanion.nvim with MCP hub integration

## Commit Guidelines

- Do not add "Generated with Claude Code" footer
- Do not add "Co-Authored-By" lines
- Follow conventional commits: `type(scope): message`
