local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/autoload/plugged")
Plug('ibhagwan/fzf-lua')
Plug('vijaymarupudi/nvim-fzf')
Plug('kyazdani42/nvim-web-devicons')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('hoob3rt/lualine.nvim')
Plug('editorconfig/editorconfig-vim')
Plug('kdheepak/tabline.nvim')

Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')

-- Auto complete fancy icons
Plug('onsails/lspkind-nvim')

Plug('puremourning/vimspector')
Plug('ryanoasis/vim-devicons')

Plug('voldikss/vim-floaterm')

Plug('APZelos/blamer.nvim')

Plug('lukas-reineke/indent-blankline.nvim')

Plug('olimorris/onedarkpro.nvim')

Plug('kyazdani42/nvim-tree.lua')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })

Plug('tpope/vim-fugitive')
Plug('windwp/nvim-autopairs')

vim.call("plug#end")
