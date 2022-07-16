vim.g.nvim_tree_refresh_wait = 500

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>")

vim.api.nvim_command("set termguicolors")

require("nvim-tree").setup {
  view = { width = 40 },
  renderer = {
    indent_markers = {
      enable = true,
    },
    special_files = { "README.md", "Makefile", "MAKEFILE", "readme.md", "Cargo.toml", "yarn.lock", "Cargo.lock" },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        ["default"] = "",
        ["symlink"] = "",
        ["git"] = {
          ["unstaged"] = "✗",
          ["staged"] = "✓",
          ["unmerged"] = "",
          ["renamed"] = "➜",
          ["untracked"] = "★",
          ["deleted"] = "",
          ["ignored"] = "◌"
        },
        ["folder"] = {
          ["arrow_open"] = "",
          ["arrow_closed"] = "",
          ["default"] = "",
          ["open"] = "",
          ["empty"] = "",
          ["empty_open"] = "",
          ["symlink"] = "",
          ["symlink_open"] = "",
        }
      },
      symlink_arrow = " >> ",
      padding = " ",
    },
    group_empty = true,
    highlight_git = true,
    add_trailing = true,
    highlight_opened_files = "icon",
    root_folder_modifier = ":~",
  },
  create_in_closed_folder = false,
  respect_buf_cwd = true,
}
