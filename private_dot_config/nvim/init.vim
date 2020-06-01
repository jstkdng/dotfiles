if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('nanotech/jellybeans.vim')
    call dein#add('scrooloose/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('cespare/vim-toml')
    call dein#add('mtdl9/vim-log-highlighting')
    call dein#add('fatih/vim-go')
    call dein#add('ngg/vim-gn')
    " Haskell
    call dein#add('neovimhaskell/haskell-vim')

    call dein#end()
    call dein#save_state()
endif

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
set expandtab

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

