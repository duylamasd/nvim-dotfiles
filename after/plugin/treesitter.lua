local ok, configs = pcall(require, "nvim-treesitter.configs")

if not ok then return end

configs.setup {
  ensure_installed = {
    "bash", "c", "cmake", "cpp", "css", "dockerfile", "go", "html", "http",
    "javascript", "jsdoc", "json", "json5", "lua", "llvm", "make", "python",
    "rust", "toml", "tsx", "typescript", "vim", "yaml", "scss", "graphql",
    "prisma", "gomod", "gowork", "markdown"
  },
  sync_install = true,
  highlight = {enable = true}
}
