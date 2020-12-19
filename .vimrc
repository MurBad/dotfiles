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
set smarttab

" Setup text width
set textwidth=80    " Before it was 78

" Set colored search
set incsearch

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
    autocmd FileType c       :call KeyShortcutsC()
    autocmd FileType cpp     :call KeyShortcutsCPP()
    autocmd FileType fortran :call KeyShortcutsFortran()
    autocmd FileType tex     :call KeyShortcutsLaTeX()
augroup END

" Loading templates depending programming language
augroup Templates
    autocmd!
    autocmd BufNewFile *.c 0r /home/murr/.vim/templates/skeleton.c
    autocmd BufNewFile *.cpp 0r /home/murr/.vim/templates/skeleton.cpp
    autocmd BufNewFile *.tex 0r /home/murr/.vim/templates/skeleton.tex
augroup END

" Special setups for special types of file
augroup PLSetups
    autocmd!
    autocmd BufEnter *.f :set shiftwidth=2
augroup END

" ==== Functions ====

" Key shortcuts to C language
function KeyShortcutsC()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && gcc % -o %< -Wall <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && gcc % -o %< -Wall && ./%< <cr>
"   Compiling with libraries
    nnoremap <buffer> <localleader>lc :w <cr> :!clear && gcc % -o %< -Wall -l
"   Just running shortcut
    nnoremap <buffer> <localleader>xx :w <cr> :!clear && ./%< <cr>

"   Debbuging program
    nnoremap <buffer> <localleader>dd :w <cr> :!clear && gcc -g % -o debug-%< && gdb debug-%< <cr>
endfunction

" Key shortcuts to C++ language
function KeyShortcutsCPP()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && g++ % -o %< -Wall <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && g++ % -o %< -Wall && ./%< <cr>
"   Compiling with libraries
    nnoremap <buffer> <localleader>lc :w <cr> :!clear && g++ % -o %< -Wall -l
"   Just running shortcut
    nnoremap <buffer> <localleader>xx :w <cr> :!clear && ./%< <cr>

"   Debbuging program
    nnoremap <buffer> <localleader>dd :w <cr> :!clear && g++ -g % -o debug-%< && gdb debug-%< <cr>
endfunction

" Key shortcuts to Fortran language
function KeyShortcutsFortran()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && gfortran % -o %< <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && gfortran % -o %< && ./%< <cr>
endfunction

" Key shortcuts to LaTeX
function KeyShortcutsLaTeX()
"   'Compiling' shortcut
    nnoremap <buffer> <localleader>ll :w <cr> :!clear && latexmk -pdf % <cr>

"   Open the pdf reader shortcut
    nnoremap <buffer> <localleader>op :w <cr> :!evince %<.pdf & <cr>
endfunction
