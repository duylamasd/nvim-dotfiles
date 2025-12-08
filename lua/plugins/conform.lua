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
        javascript = { "prettier", "prettierd", "deno_fmt", stop_after_first = true },
        typescript = { "prettier", "prettierd", "deno_fmt", stop_after_first = true },
        javascriptreact = { "prettier", "prettierd", "deno_fmt", stop_after_first = true },
        typescriptreact = { "prettier", "prettierd", "deno_fmt", stop_after_first = true },
        rust = { "rustfmt" },
        go = { "gofmt", "goimports" },
        python = { "isort", "black", stop_after_first = true },
        html = { "prettier", "prettierd", stop_after_first = true },
        css = { "prettier", "prettierd", stop_after_first = true },
        scss = { "prettier", "prettierd" },
        zig = { "zigfmt" },
        json = { "prettier", "prettierd", stop_after_first = true },
        sh = { "shfmt" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        proto = { "buf" },
      },
      formatters = {
        prettier = {
          require_cwd = true,
        },
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
