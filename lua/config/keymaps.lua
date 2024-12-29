local map = LazyVim.safe_keymap_set

map("n", "nh", vim.cmd.noh)

map("n", "bn", vim.cmd.bnext)
map("n", "bp", vim.cmd.bprev)
map("n", "bd", vim.cmd.bdelete)
