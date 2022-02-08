lua << EOF
  require'nvim-treesitter.configs'.setup {
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
    },
    sync_install = true,
    highlight = {
      enable = true,
    }
  }
EOF
