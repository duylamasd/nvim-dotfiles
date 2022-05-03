local lsp = require("lsp.lsp")
local capabilities = require("lsp.capabilities")
local on_attach = require("lsp.on-attach")

lsp.diagnosticls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'python'
  },
  init_options = {
    filetypes = {
      javascript = "eslint_d",
      ["javascript.jsx"] = "eslint_d",
      javascriptreact = "eslint_d",
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
      ["typescript.tsx"] = "eslint_d",
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        };
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
      eslint_d = {
        sourceName = "eslint_d",
        command = "./node_modules/.bin/eslint_d",
        rootPatterns = { ".git" },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        };
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }

    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' },
      },
      black = {
        command = 'black',
        args = { '--quiet', '-' },
      },
    },
    formatFiletypes = {
      javascript = 'prettier',
      javascriptreact = 'prettier',
      ["javascript.jsx"] = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      ["typescript.tsx"] = 'prettier',
      json = 'prettier',
      python = 'black'
    }
  }
}
