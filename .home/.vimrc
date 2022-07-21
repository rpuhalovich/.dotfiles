set nocompatible " be iMproved
filetype off

" Plugins:
" vim-plug (:PlugInstall - https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace' " requires homebrew vim on macos
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production'  }
Plug 'jiangmiao/auto-pairs'
call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox

let g:prettier#config#print_width = '140'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'false'

"" Settings:
set noundofile
set number
set clipboard=unnamedplus
set mouse+=a
set expandtab
set path+=**
set wildmenu
set wrap linebreak nolist
set so=999
set ts=4 sw=4
set ruler
set visualbell

" Make backspace work like in most other editors
set backspace=indent,eol,start

" Highlight search results
set hlsearch
set incsearch

auto + smart indent for code
set autoindent
set smartindent

syntax on

" File Browsing:
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view

" Keybinds:
nnoremap k gk
nnoremap j gj
" Keybind for Files
nnoremap F :Files<CR>

" Tab and Shift Tab t
" nnoremap , gT
" nnoremap . gt

