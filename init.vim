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
set undodir="~/.vim/undo-dir"
set undofile
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=12
set noshowmode
set completeopt=menuone,noinsert,noselect
set wildmenu
set colorcolumn=80
set signcolumn=number
set splitright
set cmdheight=2
set updatetime=300
set foldmethod=marker
set foldopen-=block
set path+=**
set list lcs=tab:\ \ ,trail:×

command LOVE !love .

call plug#begin("~/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'davisdude/vim-love-docs', {'branch': 'build'}
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector'
Plug 'vimwiki/vimwiki'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

colorscheme onehalfdark
let g:airline_theme='onehalfdark'
let g:rainbow_active=1
let g:quickui_color_scheme='papercol dark'
autocmd TermOpen * startinsert
" Pressing p in visual mode replaces selected text with " buffer
vnoremap <leader>p "_dP
nnoremap <leader>r :source $MYVIMRC<cr>
" Escape escapes terminal mode
tnoremap <Esc> <C-\><C-n>

" {{{ Move lines up / down in V, I, and N mode
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
inoremap <A-j> <esc>:m .+1<cr>==gi
inoremap <A-k> <esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
" }}}

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

nnoremap <leader>m :MaximizerToggle!<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <F5> :UndotreeToggle<cr>
nnoremap <C-n> :NERDTreeToggle<cr>

" {{{ Indent_blankline settings
lua << EOF
require("indent_blankline").setup {
	use_treesitter = true,
	space_char_blankline = " ",
	show_current_context = true,
}
EOF
" }}}

" {{{ Treesitter / rainbow settings
lua << EOF
require("nvim-treesitter.configs").setup {
	rainbow = {
		enable = true,
		extended_mode = true,
	}
}
EOF
" }}}

" {{{ COC completion settings
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

function! CocToggle()
	if g:coc_enabled
		CocDisable
	else
		CocEnable
	endif
endfunction
command! CocToggle :call CocToggle()

nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> [e <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]e <Plug>(coc-diagnostic-next)
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

