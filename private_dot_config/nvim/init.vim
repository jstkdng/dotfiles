if &compatible
  set nocompatible
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin(stdpath('data') . '/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'mtdl9/vim-log-highlighting'
Plug 'fatih/vim-go'
Plug 'ngg/vim-gn'
Plug 'chr4/nginx.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'alx741/vinfo'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'jstkdng/vim-avr-syntax'
Plug 'justinmk/vim-syntax-extra'
Plug 'leissa/vim-acme'

call plug#end()

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

inoremap <silent><expr> <c-space> coc#refresh()
let g:go_gopls_enabled = 1
" Better editing
set number
syntax on
set nowrap
set scrolloff=10
set colorcolumn=81
highlight ColorColumn guibg=gray

" Natural splitting
set splitbelow
set splitright

" Tab and indentation settings
filetype plugin indent on
set tabstop=4
set shiftwidth=4

" Better interaction with the system
set mouse=a
set clipboard+=unnamedplus
set guicursor=

" Terminal config
tnoremap <C-f> <C-\><C-n>

" Restore cursor position
augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Color customization
set termguicolors
let g:airline_powerline_fonts=1
let g:airline_theme="distinguished"
colorscheme jellybeans

" Remove colors if running under a tty
if ( $RTERM == 'linux' )
    colorscheme torte
    set notermguicolors
    set colorcolumn=0
    au VimEnter * AirlineToggle
endif

" ----------------------
" Plugin configuration  |
" ----------------------

" Nerdtree
map <C-a> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Chezmoi templates
autocmd BufNewFile,BufRead *.json.tmpl set filetype=json
autocmd BufNewFile,BufRead *.ini.tmpl set filetype=dosini

