local telescope_status, telescope = pcall(require, "telescope")

if not telescope_status then
  vim.notify("Couldn't load telescope.")
  return
end

local actions_status, actions = pcall(require, "telescope.actions")

if not actions_status then
  vim.notify("Couldn't load telescope actions.")
  return
end

local builtin_status, builtin = pcall(require, "telescope.builtin")

if not builtin_status then
  vim.notify("Couldn't load telescope builtin.")
  return
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  }
}

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "ff", builtin.find_files, opts)
vim.keymap.set("n", "fg", builtin.live_grep, opts)
vim.keymap.set("n", "fb", builtin.buffers, opts)
vim.keymap.set("n", "fh", builtin.help_tags, opts)
