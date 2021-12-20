" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ibhagwan/fzf-lua'
  Plug 'vijaymarupudi/nvim-fzf'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'kdheepak/tabline.nvim'

  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'

  " Auto complete fancy icons
  Plug 'onsails/lspkind-nvim'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'puremourning/vimspector'
  Plug 'ryanoasis/vim-devicons'

  Plug 'voldikss/vim-floaterm'

  Plug 'APZelos/blamer.nvim'

  Plug 'lukas-reineke/indent-blankline.nvim'

  Plug 'olimorris/onedarkpro.nvim'

  Plug 'tami5/lspsaga.nvim'

  Plug 'ray-x/lsp_signature.nvim'

call plug#end()