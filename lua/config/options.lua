---@diagnostic disable: duplicate-set-field

vim.g.blamer_enabled = 1
vim.g.blamer_prefix = " -> "
vim.g.blamer_date_format = "%d/%m/%Y %I:%M %p %Z"

vim.o.shortmess = vim.o.shortmess .. "c"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver10,r-cr-o:hor20"

vim.opt.termguicolors = true
vim.opt.relativenumber = true

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local hover_buf = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return hover_buf(contents, syntax, opts, ...)
end
