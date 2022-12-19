local ok, nvim_tree = pcall(require, "nvim-tree")

if not ok then return end

vim.keymap.set("n", "nt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile)

nvim_tree.setup {
  view = {width = 40},
  renderer = {
    indent_markers = {enable = true},
    special_files = {
      "README.md", "Makefile", "MAKEFILE", "readme.md", "Cargo.toml",
      "yarn.lock", "Cargo.lock"
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      show = {file = true, folder = true, folder_arrow = true, git = true},
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
          ["symlink_open"] = ""
        }
      },
      symlink_arrow = " >> ",
      padding = " "
    },
    group_empty = true,
    highlight_git = true,
    add_trailing = true,
    highlight_opened_files = "icon",
    root_folder_modifier = ":~"
  },
  create_in_closed_folder = false,
  respect_buf_cwd = true
}
