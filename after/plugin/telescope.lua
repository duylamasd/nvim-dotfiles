local status, telescope_builtin = pcall(require, "telescope.builtin")
if not status then
  vim.notify("Couldn't load telescope builtin.")
  return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "ff", telescope_builtin.find_files, opts)
vim.keymap.set("n", "fg", telescope_builtin.live_grep, opts)
vim.keymap.set("n", "fb", telescope_builtin.buffers, opts)
vim.keymap.set("n", "fh", telescope_builtin.help_tags, opts)
