" ==== Variables ====

" Leader and Local Leader variables
let mapleader = ","
let maplocalleader = ";"

" ==== Setupping ====

" Set line numbers 
set nu!

" Setup tab value 
set tabstop=4
set shiftwidth=4
set expandtab

" Setup text width
set textwidth=80    " Before it was 78

" ==== Mapping ====

" Custom my .vimrc file
nnoremap <leader>cv :vsplit $MYVIMRC <cr>

" Source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC <cr>

" Changing to normal mode 
inoremap jk <esc>
inoremap JK <esc>
inoremap Jk <esc>
inoremap jK <esc>

" == Operator Mapping ==

" Moves and select all inside next parentheses or
" moves and select all inside last parentheses 
onoremap np :<c-u>normal! f(vi(<cr>
onoremap lp :<c-u>normal! F)vi(<cr>

" Moves and select all inside next square brackets or
" moves and select all inside last square brackets
onoremap ns :<c-u>normal! f[vi[<cr>
onoremap ls :<c-u>normal! F]vi[<cr>

" Moves and select all inside next braces or 
" moves and select all inside last braces
onoremap nb :<c-u>normal! f{vi{<cr>
onoremap lb :<c-u>normal! F}vi{<cr>

" ==== Abbreviations ====

" Don't difference upper/lower case characters when quitting and/or saving
ca W :w
ca Q :q
ca wQ :wq
ca Wq :wq
ca WQ :wq

" ==== Autocommands ====

" Creating key shortcuts depending programming language
augroup KeyShortcuts
    autocmd!
    autocmd FileType python :nnoremap <buffer> <localleader>cc I# <esc>
    autocmd FileType c      :call KeyshortcutC()
    autocmd FileType tex    :nnoremap <buffer> <localleader>ll :w <cr> :!clear && latexmk -pdf %<cr>
augroup END

augroup Templates
    autocmd!
    autocmd BufNewFile *.c 0r /home/murr/.vim/templates/skeleton.c
    autocmd BufNewFile *.tex 0r /home/murr/.vim/templates/skeleton.tex
augroup END

" ==== Functions ====

" Key shortcuts to C language
function KeyshortcutC()

"   Commenting and uncommenting a line
    nnoremap <buffer> <localleader>cc I// <esc>
    nnoremap <buffer> <localleader>uc F/h3x <esc>
"   Commenting all after the next ';'
    nnoremap <buffer> <localleader>cn f;li //<esc>
"   Commenting all after the previous ';'
    nnoremap <buffer> <localleader>cb F;li //<esc>

"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && cc % -o %< <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && cc % -o %< && ./%< <cr>

"   Debbuging program
    nnoremap <buffer> <localleader>dd :w <cr> :!clear && cc -g % -o debug-%< && gdb debug-%< <cr>
endfunction
