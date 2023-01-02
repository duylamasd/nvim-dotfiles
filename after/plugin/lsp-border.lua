local border = {
  {"╭", "FloatBorder"}, {"─", "FloatBorder"}, {"╮", "FloatBorder"},
  {"│", "FloatBorder"}, {"╯", "FloatBorder"}, {"─", "FloatBorder"},
  {"╰", "FloatBorder"}, {"│", "FloatBorder"}
}

local hover_buf = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return hover_buf(contents, syntax, opts, ...)
end
