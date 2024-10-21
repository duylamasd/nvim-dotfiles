local M = {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 10000,
        async = false,
        quite = false,
        lsp_format = "fallback",
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
    }

    return opts
  end,
  keys = {
    {
      "<space>f",
      function()
        local conform = require("conform")
        conform.format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n" },
      desc = "Format buffer",
    },
  },
}

return M
