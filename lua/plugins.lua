local treesitter = require("core.plugins.treesitter")
local tokyonight = require("core.plugins.tokyonight")
local autopairs = require("core.plugins.autopairs")
local cmp = require("core.plugins.cmp")
local dapui = require("core.plugins.dapui")
local dap = require("core.plugins.debugger")
local ibl = require("core.plugins.ibl")
local mason = require("core.plugins.mason")
local null_ls = require("core.plugins.null-ls")
local startup = require("core.plugins.startup")
local lualine = require("core.plugins.lualine")
local telescope = require("core.plugins.telescope")
local undotree = require("core.plugins.undotree")
local noice = require("core.plugins.noice")

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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = {"VeryLazy"},
    config = treesitter.config
  }, {"tpope/vim-fugitive"},
  {"windwp/nvim-autopairs", config = autopairs.config}, {
    "williamboman/mason.nvim",
    dependencies = {
      {"williamboman/mason-lspconfig.nvim"}, {"hrsh7th/cmp-nvim-lsp"},
      {"neovim/nvim-lspconfig"}
    },
    config = mason.config
  }, {
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
  }, {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
  }, {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = noice.config,
    keys = noice.keys,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim", -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify"
    }
  }
}