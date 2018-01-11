:syntax on
:set nu
:colorscheme brogrammer
:set omnifunc=syntaxcomplete#Complete
:set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces"

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"Pathogen
execute pathogen#infect()

" Gitgutter
set updatetime=250

" Remove automaticaly trailing
autocmd BufEnter * EnableStripWhitespaceOnSave
"autocmd FileAppendPre *.pl %s/\s\+$//e

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
set laststatus=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

" python
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

