lua << EOF
  local onedarkpro = require('onedarkpro')
  onedarkpro.setup({
    theme = onedark, -- Override with "onedark" or "onelight". Alternatively, remove the option and the theme uses `vim.o.background` to determine
    colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
    hlgroups = {}, -- Override default highlight groups
    styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "bold,italic", -- Style that is applied to keywords
      functions = "italic", -- Style that is applied to functions
      variables = "italic", -- Style that is applied to variables
    },
    options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = true, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    },
    plugins = {
      native_lsp = true,
      treesitter = true,
      polygot = false,
    }
  })
  onedarkpro.load()
EOF
