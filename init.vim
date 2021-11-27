set exrc
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set noswapfile
set backupdir-=.'
set undodir=!/.vim/undodir
set undofile
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=12
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

call plug#begin("~/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch':'release'}
call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

let mapleader = " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <F5> :UndotreeToggle<cr>

" Removes word under cursor, can replace it, press . to replace more instances
"nnoremap <leader>re *``cgn

" Save undo breakpoints in insert mode with these characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap <cr> <cr><c-g>u

