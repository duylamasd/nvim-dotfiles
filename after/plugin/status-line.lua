local status, lualine = pcall(require, "lualine")
if (not status) then return end

local tabline = require("tabline")

tabline.setup {enable = false}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    section_separators = {left = "", right = ""},
    component_separators = {left = "", right = ""},
    disabled_filetypes = {"NvimTree"},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"windows"},
    lualine_x = {
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        symbols = {error = " ", warn = " ", info = " ", hint = " "}
      }, "encoding", "filetype", "filesize"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {"mode"},
    lualine_b = {},
    lualine_c = {"windows"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {tabline.tabline_buffers},
    lualine_x = {tabline.tabline_tabs},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {"fugitive", "nvim-tree"}
}
