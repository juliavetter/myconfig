" Vim color file

" Remove all existing highlighting and set the defaults.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mycolor"

" Use red for special instead of lightred
hi Special ctermfg=Red

" vim: sw=2
