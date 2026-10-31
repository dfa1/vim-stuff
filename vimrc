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
" strip trailing whitespace on save, keeping cursor and search history;
" skip filetypes where trailing whitespace is meaningful
function! s:StripTrailingWhitespace()
  if &filetype =~# '^\(markdown\|diff\)$'
    return
  endif
  let l:view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:view)
endfunction
autocmd BufWritePre * call s:StripTrailingWhitespace()

au BufRead,BufNewFile *.pp              set filetype=puppet

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" enables autowrap at column 80
autocmd FileType markdown setlocal textwidth=80 formatoptions+=t
