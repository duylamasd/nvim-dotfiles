lua << EOF
local status, lualine = pcall(require, "lualine")
if (not status) then return end

local tabline = require'tabline'

tabline.setup {}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { tabline.tabline_buffers },
    lualine_x = { tabline.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'fugitive'}
}
EOF
