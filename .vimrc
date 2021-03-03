" ==== Plugins ====
" Vim-plug install: {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" Plugins: {{{
call plug#begin()
Plug 'OmniSharp/omnisharp-vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" ==== Variables ====

" Leader and Local Leader variables
let mapleader = ","
let maplocalleader = ";"

" ==== Setupping ====

syntax on
filetype plugin on
filetype indent off

" Colorscheme
colorscheme molokai
let g:molokai_original = 1

" Folding (Use 'za' to open/close folding)
set foldmethod=marker
set foldmarker={{{,}}}

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

" Airline: {{{
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" NerdTree: {{{
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" }}}

" ==== Mapping ====

" Custom my .vimrc file
nnoremap <leader>cv :vsplit $MYVIMRC <cr>

" Source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC <cr>

" Calls 'MySpellLang()' function
nnoremap <leader>s :call MySpellLang() <cr>

" Changing to normal mode 
inoremap jk <esc>
inoremap JK <esc>
inoremap Jk <esc>
inoremap jK <esc>

" Buffer change
nnoremap <C-q> :bprevious <cr>
nnoremap <C-e> :bnext <cr>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>

" Tagbar
nmap <F8> :TagbarToggle<cr>

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
    autocmd BufNewFile *.py 0r /home/murr/.vim/templates/skeleton.py
augroup END

" Special setups for special types of file
augroup PLSetups
    autocmd!
    autocmd BufNewFile,BufEnter *.f :set shiftwidth=2
augroup END

" ==== Functions ====

" C Shortcuts: {{{
function KeyShortcutsC()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && gcc % -o %< -Wall <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && gcc % -o %< -Wall && ./%< <cr>
"   Compiling with libraries
    nnoremap <buffer> <localleader>lc :w <cr> :!clear && gcc % -o %< -Wall -l

"   Debbuging program
    nnoremap <buffer> <localleader>dd :w <cr> :!clear && gcc -g % -o debug-%< && gdb debug-%< <cr>
endfunction
" }}}

" Cpp Shortcuts: {{{
function KeyShortcutsCPP()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && g++ % -o %< -Wall <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && g++ % -o %< -Wall && ./%< <cr>
"   Compiling with libraries
    nnoremap <buffer> <localleader>lc :w <cr> :!clear && g++ % -o %< -Wall -l
"   Compiling and run with OpenCV 4
    nnoremap <buffer> <localleader>oc :w <cr> :!clear && g++ % -o %< -Wall -I/usr/include/opencv4 && ./%< <cr>
 
"   Debbuging program
    nnoremap <buffer> <localleader>dd :w <cr> :!clear && g++ -g % -o debug-%< && gdb debug-%< <cr>
endfunction
" }}}

" Fortran Shortcuts: {{{
function KeyShortcutsFortran()
"   Just Compiling shortcut and Compiling and Run shortcut
    nnoremap <buffer> <localleader>sc :w <cr> :!clear && gfortran % -o %< <cr>
    nnoremap <buffer> <localleader>xc :w <cr> :!clear && gfortran % -o %< && ./%< <cr>
endfunction
" }}}

" LaTeX Shortcuts: {{{
function KeyShortcutsLaTeX()
"   'Compiling' shortcut
    nnoremap <buffer> <localleader>ll :w <cr> :!clear && latexmk -pdf % <cr>

"   Open the pdf reader shortcut
    nnoremap <buffer> <localleader>op :w <cr> :!evince %<.pdf & <cr>
endfunction
" }}}

" Toggle Spell Check: {{{
let g:myLang = 0
let g:myLangList = ['nospell', 'pt_br', 'en_us']

function! MySpellLang()
    " Loop through languages
    if g:myLang == 0 | setlocal nospell | endif
    if g:myLang == 1 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
    if g:myLang == 2 | let &l:spelllang = g:myLangList[g:myLang] | setlocal spell | endif
  
    " Show current language
    echomsg 'language:' g:myLangList[g:myLang]
    
    let g:myLang = g:myLang + 1
    if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
" }}}
