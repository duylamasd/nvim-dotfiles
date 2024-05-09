local M = {}

M.opts = function()
  local opts = {
    format = {
      timeout_ms = 10000,
      async = false,
      quite = false,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier", "deno_fmt" } },
      typescript = { { "prettierd", "prettier", "deno_fmt" } },
      rust = { "rustfmt" },
      go = { "gofmt", "goimports" },
      python = { "isort", "black" },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
      zig = { "zigfmt" },
      json = { { "prettierd", "prettier" } },
      sh = { "shfmt" },
      cpp = { "clang-format" },
      c = { "clang-format" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  }

  return opts
end

M.keys = {
  {
    "<space>f",
    function()
      local conform = require("conform")
      conform.format({ async = true, lsp_fallback = true })
    end,
    mode = { "n" },
    desc = "Format buffer",
  },
}

return M
