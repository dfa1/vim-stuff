set nocp
set noeb
set vb
set sc
set backspace=indent,eol,start

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

set paste
set number
set ruler

set encoding=utf-8
set fileencoding=utf-8

colorscheme slate

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e

au BufRead,BufNewFile *.pp              set filetype=puppet

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
