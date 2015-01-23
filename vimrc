" github.com/garybernhardt/dotfiles
" github.com/mislav/vimfiles
" github.com/carlhuda/janus
" vimcasts.org
" vim.wikia.com
" for more info on any settings
" :help <command> eg
" :help showcmd

set nocompatible

call pathogen#infect()

syntax enable
filetype plugin indent on

set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf-8

set autoindent
set smarttab
set number                      " need those line numbers
set ruler                       " show the line/column number of the cursor position
set showcmd                     " display incomplete commands

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

"" Whitespace
set nowrap                      " wrap lines, switch with set wrap/nowrap
set linebreak                   " break line for wrapping at end of a word
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=3                 " Minimum number of screen lines to keep above/below the cursor

set ttimeout
set ttimeoutlen=1

" Show tabs and traling spaces
set list listchars=tab:»·,trail:·

" Mouse
set mouse=a

" Store temporary files in a central spot
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nobackup
set noswapfile

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber,css set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
  autocmd FileType javascript set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Remove all trailing whitespace
  autocmd FileType vim,c,cpp,java,php,ruby,css,html,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set wildmenu                    " enhanced command line completion
set wildignore+=*.o,*.obj,.bundle,coverage,.DS_Store,_html,.git,*.rbc,*.class,.svn,vendor/gems/*,vendor/rails/*

"" Colors
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set term=xterm-256color

set background=dark             " or light
colorscheme jellybeans
highlight LineNr ctermfg=darkgrey
set cursorline                  " highlight current line

" Window
set cmdheight=2                 " number of lines for the command line
set laststatus=2                " always have a status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set showtabline=2               " always show tab bar
set winwidth=84                 "

" Airline
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'

" Mappings
let mapleader="~"
let g:mapleader="~"

" switch most recent buffers
nnoremap <leader><leader> <c-^>

" clear the search buffer
nnoremap <CR> :nohlsearch<cr>

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Tabs:
nmap <leader>[ :tabprevious<cr>
nmap <leader>] :tabnext<cr>
nmap <c-T> :tabnew<cr>

" Splits
" quick split and jump into window
map :vs :vsplit<cr><c-l>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" open split scratch buffer
nmap <leader>; :Sscratch<cr>

" edit or view in same dir
map <leader>e :edit %%
map <leader>v :view %%

" Remap shift key failure
command! W :w
command! Wq :wq
command! E :e

" force vim
"map <Left> :echoe "use: l"<cr>
"map <Right> :echoe "use: h"<cr>
"map <Up> :echoe "use: j"<cr>
"map <Down> :echoe "use: k"<cr>

" Plugin mappings
" Fugutive shortcuts
map :gs :Gstatus<cr>
map :gb :Gblame<cr>
map :gd :Gdiff<cr>


" Resize windows quickly
" reset with <c-w>=
nmap <leader>H :vertical res +20<cr>
nmap <leader>L :vertical res -20<cr>

" Scroll other window
function! ScrollOtherWindowDown(count)
  normal! 
  normal! 
  normal! 
endfunction
function! ScrollOtherWindowUp(count)
  normal! 
  normal! 
  normal! 
endfunction
nnoremap <c-w>y :call ScrollOtherWindowUp(v:count)<cr>
nnoremap <c-w>e :call ScrollOtherWindowDown(v:count)<cr>

