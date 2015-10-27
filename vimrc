" github.com/garybernhardt/dotfiles
" github.com/mislav/vimfiles
" github.com/carlhuda/janus
" vimcasts.org
" vim.wikia.com
" for more info on any settings
" :help <command> eg
" :help showcmd

set nocompatible

set timeoutlen=1200
set ttimeout
set ttimeoutlen=50
set ttyfast

set history=500

filetype off

call pathogen#infect()

set syntax=on

filetype on
filetype plugin on
filetype indent on

syntax enable

let JSHintUpdateWriteOnly = 1

" Mustache, Handlebars
let mustache_abbreviations=1

" mappings
let mapleader=","
let g:mapleader=","

set background=dark
colorscheme tomorrow-night

set term=xterm
set termencoding=utf-8
set fileencodings=utf8,cp1251
set encoding=utf-8
set t_Co=16

" tabs and indention
set autoindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftround
set shiftwidth=2
set copyindent

" layout
set number
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set list
set listchars=tab:»·,trail:·,eol:¬,extends:❯,precedes:❮
set showcmd
set showmode

set cmdheight=2
set winwidth=84

hi User1 ctermfg=Black  ctermbg=Red cterm=NONE
hi User2 ctermfg=Black  ctermbg=DarkGreen cterm=NONE
hi User3 ctermfg=Black  ctermbg=Yellow cterm=NONE
hi User4 ctermfg=Black  ctermbg=DarkBlue cterm=NONE
hi User5 ctermfg=Black  ctermbg=Magenta cterm=NONE
hi User6 ctermfg=Black  ctermbg=Cyan cterm=NONE
hi User7 ctermfg=LightGrey   ctermbg=DarkGray cterm=NONE
hi User8 ctermfg=Black  ctermbg=Gray cterm=NONE
set statusline=\ %F%M%=
set statusline+=%3*\%w%r\%*
set statusline+=%8*\ %n\ %*
set statusline+=%4*\ %{&filetype}\ %*
set statusline+=%4*\%{&fileformat}\%*
set statusline+=%4*\ %{&encoding}\ %*
set statusline+=%7*\ %L\ %*
set statusline+=%8*\ %l\%*
set statusline+=%8*\ %v\ %*
set statusline+=%2*\ %P\ %*
set statusline+=%1*\ 0x%04B\ %*
set laststatus=2

function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .' '
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') . ' ' : 'No Name ')

    if bufmodified
      let s .= '+ '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
hi TabLine        ctermfg=Black       ctermbg=LightGray          cterm=NONE
hi TabLineFill    ctermfg=Black       ctermbg=LightGray          cterm=NONE
hi TabLineSel     ctermfg=LightGray   ctermbg=NONE          cterm=NONE
set tabline=%!Tabline()
set showtabline=2

" color [all languages]
" ============================================================
hi NonText        ctermfg=Black       ctermbg=NONE          cterm=NONE
hi Visual         ctermfg=NONE        ctermbg=DarkGray      cterm=NONE
hi MatchParen     ctermfg=White       ctermbg=DarkGray      cterm=NONE
hi LineNr         ctermfg=Gray        ctermbg=NONE          cterm=NONE
hi CursorLine     ctermfg=NONE        ctermbg=NONE          cterm=NONE
hi CursorLineNR   ctermfg=Yellow      ctermbg=NONE          cterm=NONE

hi VertSplit      ctermfg=Black       ctermbg=Black         cterm=NONE

" hi statusline current/not current window
hi StatusLine     ctermfg=Black       ctermbg=Brown        cterm=NONE
hi StatusLineNC   ctermfg=Yellow      ctermbg=Gray          cterm=NONE

" hi statusline insert/normal mode
au InsertLeave * highlight StatusLine   ctermfg=Black       ctermbg=Brown      cterm=NONE
au InsertEnter * highlight StatusLine   ctermfg=Black       ctermbg=DarkGreen   cterm=NONE

" hi cursor line insert/normal mode
au InsertLeave * highlight CursorLineNR ctermfg=Yellow      ctermbg=NONE        cterm=NONE
au InsertEnter * highlight CursorLineNR ctermfg=Red    ctermbg=NONE        cterm=NONE

" CSS
hi cssAttr ctermfg=LightGray ctermbg=NONE cterm=NONE


" whitespace
set nowrap
set linebreak
set backspace=indent,eol,start
set scrolloff=5

" mouse
set mouse=a
set mousehide

" Store temporary files in a central spot
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nobackup
set noswapfile

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Menu
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  autocmd FileType text setlocal textwidth=78

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby       set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType haml       set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType eruby      set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType sass       set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType cucumber   set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType python     set ai ts=4 sts=4 sw=4 expandtab

  autocmd FileType html       set ai ts=4 sts=4 sw=4 expandtab
  autocmd FileType css        set ai ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript set ai ts=4 sts=4 sw=4 expandtab

  autocmd FileType make       set ai ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml       set ai ts=2 sts=2 sw=2 expandtab


  autocmd BufRead *.mkd       set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  autocmd FileType vim,c,cpp,java,php,ruby,css,html,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

  autocmd BufRead,BufNewFile *.rss setfiletype xml
  autocmd BufRead,BufNewFile *.sass setfiletype sass

  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline

  autocmd FileType css setlocal iskeyword+=-

  autocmd FileType javascript   noremap <buffer> <leader>f :call JsBeautify()<cr>
  autocmd FileType html         noremap <buffer> <leader>f :call HtmlBeautify()<cr>
  autocmd FileType css          noremap <buffer> <leader>f :call CSSBeautify()<cr>
augroup END


" open .vimrc
nmap <leader>vo :tabnew ~/.vimrc<CR>
"
" reload .vimrc
nmap <leader>vr :so $MYVIMRC<CR>

" switch most recent buffers
nnoremap <leader><leader> <c-^>

" clear the search buffer
nnoremap <CR> :nohlsearch<cr>

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Tabs
nmap <leader>[ :tabprevious<cr>
nmap <leader>] :tabnext<cr>
nmap <leader>t :tabnew<cr>

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

