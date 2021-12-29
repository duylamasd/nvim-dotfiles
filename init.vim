source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/lspconfig.vim
source $HOME/.config/nvim/vim-plug/telescope.vim
source $HOME/.config/nvim/vim-plug/lualine.vim
source $HOME/.config/nvim/vim-plug/completion.vim
source $HOME/.config/nvim/vim-plug/tabline.vim
source $HOME/.config/nvim/vim-plug/nerdtree.vim
source $HOME/.config/nvim/vim-plug/git-blamer.vim
source $HOME/.config/nvim/vim-plug/indent-blankline.vim
source $HOME/.config/nvim/vim-plug/onedarkpro.vim

set number

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

let g:vimspector_enable_mappings = 'HUMAN'
