local treesitter = require("core.plugins.treesitter")
local tokyonight = require("core.plugins.tokyonight")
local autopairs = require("core.plugins.autopairs")
local cmp = require("core.plugins.cmp")
local dapui = require("core.plugins.dapui")
local dap = require("core.plugins.debugger")
local ibl = require("core.plugins.ibl")
local lsp_signature = require("core.plugins.lsp-signature")
local mason = require("core.plugins.mason")
local null_ls = require("core.plugins.null-ls")
local nvim_tree = require("core.plugins.nvim-tree")
local startup = require("core.plugins.startup")
local lualine = require("core.plugins.lualine")
local telescope = require("core.plugins.telescope")
local undotree = require("core.plugins.undotree")

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = telescope.config,
    keys = telescope.keys
  }, {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {"kyazdani42/nvim-web-devicons", opt = true}, {"kdheepak/tabline.nvim"}
    },
    config = lualine.config
  }, {"lukas-reineke/indent-blankline.nvim", config = ibl.config},
  {"hrsh7th/vim-vsnip"}, {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"}, {"onsails/lspkind-nvim"}
    },
    config = cmp.config
  }, {"editorconfig/editorconfig-vim"}, {"APZelos/blamer.nvim"}, {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons" -- optional, for file icons
    },
    version = "nightly", -- optional, updated every week. (see issue #1193)
    config = nvim_tree.config,
    keys = nvim_tree.keys
  }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {"VeryLazy"},
    config = treesitter.config
  }, {"tpope/vim-fugitive"},
  {"windwp/nvim-autopairs", config = autopairs.config},
  {"ray-x/lsp_signature.nvim", config = lsp_signature.config}, {
    "williamboman/mason.nvim",
    dependencies = {
      {"williamboman/mason-lspconfig.nvim"}, {"hrsh7th/cmp-nvim-lsp"},
      {"neovim/nvim-lspconfig"}
    },
    config = mason.config
  }, {"nvim-tree/nvim-web-devicons"}, {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = null_ls.config
  }, {"mbbill/undotree", keys = undotree.keys},
  {"folke/tokyonight.nvim", config = tokyonight.config}, {
    "startup-nvim/startup.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = startup.config
  }, {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      config = dapui.config,
      keys = dapui.keys
    },
    keys = dap.keys
  }
}
