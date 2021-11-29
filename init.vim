let mapleader = " "

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
set signcolumn=number
set splitright
set cmdheight=2
set updatetime=300
set foldmethod=marker

call plug#begin("~/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'davisdude/vim-love-docs', {'branch': 'build'}
call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" {{{ Undo InsertMode breakpoints
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
" }}}

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
inoremap <C-x> :Telescope select_vertical<cr>

" {{{ COC settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> [e <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next)
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

