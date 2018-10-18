" Vundle Init and Plugins stuff
"
set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize

set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim

filetype off                  " required

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" My Plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/fly.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'wincent/command-t'
Plugin 'tmhedberg/SimpylFold'
call vundle#end()            " required

syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Initializations
set nocompatible " No comatibility with old Vi
" set noswapfile
set textwidth=120 "Text width

" Work/Userspace Settings
set tabstop=4 " Show a tabstop as 4 spaces
set softtabstop=4   " Sets the number of columns for a TAB
set shiftwidth=4 " Auto indent shifts 4 spaces
set expandtab " Insert 4 spaces when Tab is pressed

" Kernel Code setting
" set noexpandtab                              " use tabs, not spaces
" set tabstop=8                                " tab this width of spaces
" set shiftwidth=8                             " indent this width of spaces
"
set number " Display line numbers
set incsearch " Incremental Search
set hlsearch " Highlight searches
set smartcase " Ignore case if searching lowercase, not otherwise
set cursorline " Horizontal line to indicate cursor
set scrolloff=5 " Number of lines to keep at the top and bottom of a window while scrolling
set wildmenu " Pressing tab in command mode shows options on status bar
set ruler " Display Ruler always.
set laststatus=2 " Display Statusbar always.
set hidden " Hide closed buffers instead of closing them.
set backspace=indent,eol,start " Backspace works over whitespaces also
set t_Co=256 " Set terminal to 256 colors
set background=dark " Set dark colorschemes
set tags=tags; " Set vim to look for tags file recursively upwards
set pastetoggle=<F8> " Toggle prevent unnecessary autoindent on mouse click paste
set mouse=a
set cmdheight=1
set colorcolumn=80

colorscheme molokai
cnoremap help vert help

" Key Mappings
let mapleader=";"    " For setting the leader

"" Navigation mappings
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk

" Save and Exit Shortcuts
inoremap <leader>w <C-o>:w<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>x :x<CR>

"" Maps Ctrl+[h,j,k,l] to move between window splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"" Buffer Handling
noremap <F2> :bprevious<CR>
noremap <F3> :bnext<CR>                 
noremap <F4> :badd  
noremap <leader>b :buffers<CR>:buffer<Space>
noremap <F7> :set list!<CR>

" Window Resize 
"" Maps Ctrl+arrow keys to resize the window splits
map <C-Down> <C-w>+ 
map <C-Up> <C-W>-
map <C-Left> <C-W><
map <C-Right> <C-w>>

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" AirLine Settings
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#whitespace#enabled = 0
nnoremap <leader>ar :AirlineRefresh<CR>

" NerdCommenter Settings
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Toggle shortcut
noremap <F6> :NERDTreeToggle<CR>

"Omnicomplete
noremap <leader>c :<C-n><CR>

"Tagbar
noremap <F9> :TagbarToggle<CR>

" git gutter
nnoremap <leader>gs :GitGutterSignsToggle<CR>

" fly-vim
nnoremap <leader>l :SW<CR>
nnoremap <leader><leader>b :BD<CR>
nnoremap <leader><leader>l :SW<CR>

" commandT
let g:CommandTMaxFiles=2000000
nnoremap <leader>p :CommandT<CR>

" folding
nnoremap <leader>' zf%
set foldcolumn=0
hi VertSplit ctermfg=darkgrey
set fillchars+=vert:\ 
