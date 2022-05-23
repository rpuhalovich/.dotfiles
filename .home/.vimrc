" GLOBAL SETTINGS:

set noundofile
set number relativenumber
set clipboard=unnamedplus
set mouse=a
set expandtab
set path+=**
set wildmenu
set wrap linebreak nolist
set so=999

syntax on

" FILE BROWSING:

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

nnoremap k gk
nnoremap j gj

