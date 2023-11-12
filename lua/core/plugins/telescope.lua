local M = {}

M.config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup {
    defaults = { mappings = { n = { ["q"] = actions.close } } },
    pickers = { find_files = { theme = "dropdown" } }
  }
end

local builtin = require("telescope.builtin")

M.keys = {
  {
    "ff",
    builtin.find_files,
    desc = "Telescope find files",
    mode = { "n" },
    noremap = true,
    silent = true
  }, {
  "fg",
  builtin.live_grep,
  desc = "Telescope live grep",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "fb",
  builtin.buffers,
  desc = "Telescope buffers",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "fh",
  builtin.help_tags,
  desc = "Telescope help tags",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "gc",
  builtin.git_commits,
  desc = "Telescope git commits",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "gbc",
  builtin.git_bcommits,
  desc = "Telescope git bcommits",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "gbr",
  builtin.git_branches,
  desc = "Telescope git branches",
  mode = { "n" },
  noremap = true,
  silent = true
}, {
  "ts",
  builtin.treesitter,
  desc = "Telescope treesitter",
  mode = { "n" },
  noremap = true,
  silent = true
}
}

return M
