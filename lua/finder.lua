vim.api.nvim_set_keymap("n", ";f", [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";r", [[<cmd>Telescope live_grep<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "\\", [[<cmd>Telescope buffers<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";;", [[<cmd>Telescope help_tags<cr>]], { noremap = true, silent = true })
