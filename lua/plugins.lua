return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use { "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "kyazdani42/nvim-web-devicons" }
  }
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use {
    "kdheepak/tabline.nvim",
    requires = { "hoob3rt/lualine.nvim", "kyazdani42/nvim-web-devicons" }
  }
  use "lukas-reineke/indent-blankline.nvim"

  use "hrsh7th/vim-vsnip"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-vsnip"

  use "onsails/lspkind-nvim"

  use "puremourning/vimspector"

  use "editorconfig/editorconfig-vim"

  -- Theme
  use "olimorris/onedarkpro.nvim"

  -- Git blamer
  use "APZelos/blamer.nvim"

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }

  use "tpope/vim-fugitive"

  use "windwp/nvim-autopairs"

  use "ray-x/lsp_signature.nvim"

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use { "mbbill/undotree" }
end)
