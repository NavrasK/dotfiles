let mapleader = " "

set exrc
set relativenumber
set number
set nohlsearch
set hidden
set errorbells
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
set updatetime=100
set foldmethod=marker
set foldopen-=block
set path+=**
set list lcs=tab:\ \ ,trail:×
set mouse+=a

command LOVE !love .

" {{{ VimPlugs
call plug#begin("~/.vim/plugged")
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'gruvbox-community/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
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
Plug 'psliwka/vim-smoothie'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sindrets/winshift.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'folke/which-key.nvim'
call plug#end()
" }}}

" Colour options: gruvbox, onehalfdark, moonfly
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set showtabline=2

" Opening terminal window enters insert mode
autocmd TermOpen * startinsert
" Escape escapes terminal mode
tnoremap <Esc> <C-\><C-n>
" Quick open terminal as vertical split
nnoremap <leader>ot <C-w>v:term<cr>

" Activate rainbow parentheses and hex colorizer
let g:rainbow_active=1
lua require'colorizer'.setup()
" Pressing p in visual mode replaces selected text with " buffer
vnoremap <leader>p "_dP
" Refresh current window with latest init.vim
nnoremap <leader>r :source $MYVIMRC<cr>
" Ctrl-W + m moves around the current window with HJKL
nnoremap <C-w><C-m> <cmd>WinShift<cr>
nnoremap <C-w>m <cmd>WinShift<cr>

" {{{ Move lines up / down in V, I, and N mode
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
inoremap <A-j> <esc>:m .+1<cr>==gi
inoremap <A-k> <esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

nnoremap <A-h> <<
nnoremap <A-l> >>
vnoremap <A-h> <gv
vnoremap <A-l> >gv
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

" {{{ Mouse Control / Heresy
nnoremap <leader>fw :w<cr>
nnoremap <LeftMouse> <LeftMouse><esc>
inoremap <LeftMouse> <LeftMouse><esc>
nnoremap <RightMouse> <LeftMouse>i
inoremap <RightMouse> <esc><LeftMouse>i
" }}}

" {{{ Indent blankline settings
lua << EOF
require("indent_blankline").setup {
	use_treesitter = true,
	space_char_blankline = " ",
	show_current_context = true,
}
EOF
" }}}

" {{{ WhichKey Settings
lua << EOF
require("which-key").setup {
	plugins = {
		spelling = {enabled = true}
	}
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

" Activate safe mode for exrc
set secure

