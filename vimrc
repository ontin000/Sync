"set guifont=9x15bold
"set guifont=8x13bold
"set guifont=7x14bold
"set guifont=7x13bold

"Map the F5 key to quit without saving
:map <F5> <Esc>:q!<Return>
imap jj <Esc> " Professor VIM says '97% of users prefer jj over esc'
command Nt NERDTree

set shell=/bin/bash

"Always display the current cursor position in the lower right corner
set ruler
"Show the current mode
set showmode
"Search as you type
set incsearch
"Remeber up to 10 commands
set history=10
"Set how many lines are used to display a vim message
set cmdheight=3
"Overides ingnore case if upper case is used
set smartcase
"Set the number of spaces a tab uses
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
"Do not search around
set nowrapscan
"Ignore case when searching
set ignorecase
"Enable deletion of all characters
set bs=2
"No compatibility with vi
set nocompatible
"Use auto indentation
set autoindent
"Use smart indenting when starting a new line
set smartindent
"Turn on syntax highlighting
syntax on
filetype on
"Highlight current line
set cursorline
set nu
au BufNewFile,BufRead *.styl set filetype=css
"au BufNewFile,BufRead *.jade set filetype=haml
au BufNewFile,BufRead *.htm set filetype=php
autocmd FileType make setlocal noexpandtab

filetype plugin on
filetype indent on

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

"Functions
function! SingleUnderline()
t.
s/./-/g
endfunction
function! X()
let line = getline(".")
let repl = substitute(line,'<\(.\+\)>', '<\1><\/\1>','g')
call setline(".", repl)
endfunction
