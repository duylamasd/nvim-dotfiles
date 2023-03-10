local ok, onedarkpro = pcall(require, "onedarkpro")

if not ok then return end

local is_tokyonight_ok, tokyonight = pcall(require, "tokyonight")

if not is_tokyonight_ok then return end

onedarkpro.setup({
  colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
  highlights = {}, -- Override default highlight groups
  styles = {
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "bold,italic", -- Style that is applied to keywords
    functions = "italic", -- Style that is applied to functions
    variables = "italic", -- Style that is applied to variables
    types = "bold",
    numbers = "NONE",
    conditionals = "italic",
    virtual_text = "italic"
  },
  options = {
    bold = true, -- Use the themes opinionated bold styles?
    italic = true, -- Use the themes opinionated italic styles?
    underline = true, -- Use the themes opinionated underline styles?
    undercurl = true, -- Use the themes opinionated undercurl styles?
    cursorline = false, -- Use cursorline highlighting?
    transparency = true, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    window_unfocussed_color = false -- When the window is out of focus, change the normal background?
  },
  plugins = {
    lsp_saga = true,
    treesitter = true,
    polygot = false,
    nvim_lsp = true,
    packer = true,
    nvim_tree = true
  }
})

tokyonight.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = {italic = true},
    keywords = {italic = true, bold = true},
    functions = {bold = true},
    variables = {italic = true},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark" -- style for floating windows
  },
  sidebars = {"qf", "help"}, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors) end,
  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function(highlights, colors) end
})

vim.cmd("colorscheme tokyonight")
