set autoindent
filetype plugin indent on

set expandtab
set shiftwidth=4
set tabstop=4

set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set history=200

set ruler
set number
set showcmd

set modeline
set modelines=5

set so=3

syntax enable
color mycolor

function! SetupPython()
	setlocal softtabstop=4
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal noexpandtab
endfunction
command! -bar SetupPython call SetupPython()
