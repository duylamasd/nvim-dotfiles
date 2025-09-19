local M = {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.10.0",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "llvm",
        "make",
        "python",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "scss",
        "graphql",
        "prisma",
        "gomod",
        "gowork",
        "markdown",
      },
      sync_install = true,
      highlight = { enable = true },
    })
  end,
}

return M
