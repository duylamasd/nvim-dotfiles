local M = {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    version = "^1.0.0",
    opts = {
      ensure_installed = {
        "clangd",
        "stylua",
        "golangci-lint",
        "flake8",
        "cpplint",
        "clang-format",
        "goimports",
        "isort",
        "black",
        "shfmt",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
    end,
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
          },
        },
      },
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = false,
      },
      document_highlight = {
        enabled = true,
      },
      capabilities = {},
      servers = {
        denols = {
          root_dir = function(...)
            return require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(...)
          end,
          settings = {},
        },
        ts_ls = {
          root_dir = function(...)
            return require("lspconfig").util.root_pattern("package.json")(...)
          end,
          single_file_support = false,
          settings = {},
        },
        gopls = {
          root_dir = function(...)
            return require("lspconfig").util.root_pattern("go.mod", ".git")(...)
          end,
          settings = {},
        },
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
      },
    },
    setup = {},
  },
}

return M
