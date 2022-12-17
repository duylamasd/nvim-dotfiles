vim.api.nvim_command("set number relativenumber")
vim.api.nvim_command("set termguicolors")

vim.g.vimspector_enable_mappings = "HUMAN"

vim.g.blamer_enabled = 1
vim.g.blamer_prefix = " -> "
vim.g.blamer_date_format = "%d/%m/%Y %I:%M %p %Z"
