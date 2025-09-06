"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/pack/themes/opt/solarized8/'))
    silent !git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
endif

set t_Co=256
"colorscheme solarized8 
set clipboard=unnamed

" Initialize plugin system
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/AutoComplPop'
Plug 'liuchengxu/space-vim-theme'
Plug 'nvie/vim-flake8'
Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme space_vim_theme 

" ---- Minimal configuration:
syntax on
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=2  " Set number of spaces per auto indentation
set noexpandtab     " When using <Tab>, put spaces instead of a <tab> character
set tabstop=2   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list
set splitbelow splitright
set nolist
set number
set relativenumber
set laststatus=2
set hidden
set showcmd
set hlsearch
set ruler
set nocompatible
set wildmenu
set showmatch
set nowrap
set mouse=a
set complete+=kspell
set completeopt=menuone,longest
set ignorecase  
set omnifunc=ccomplete#Complete
set tags=~/.vim/system.tags,tags
set shortmess-=S

filetype plugin indent on
augroup filetypedetect
    au BufNewFile,BufRead *.s,*.inc set ft=asm_ca65
    augroup endif

autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ --std=c++17 -Wall -g -I/opt/homebrew/Cellar/sfml/2.6.1/include -L/opt/homebrew/Cellar/sfml/2.6.1/lib -lsfml-graphics -lsfml-window -lsfml-system '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Status Line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" NERDTree Configuration
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeFileLines = 1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction 
com! DiffSaved call s:DiffWithSaved()

" Change the current directory to the file that was just opened
" autocmd BufEnter * lcd %:p:h

let mapleader=" "
let maplocalleader=" "

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>
