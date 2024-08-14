" -- KEYBINDS --
let mapleader = " "

nnoremap <leader>cfg :e<space>~\.vimrc<cr>

inoremap <C-p> <up>
inoremap <C-n> <down>
nnoremap <C-p> <up>
nnoremap <C-n> <down>

nnoremap s :w<cr>
vnoremap s <esc>:w<cr>
nnoremap <c-q> :q<cr>

nnoremap <leader>b :buffer<space>
nnoremap <leader>B mm:%bd\|e#\|bd#<cr>`m

nnoremap <leader>a :%y+<cr>

nnoremap <leader>e :e<space>.<cr>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" easier copying and pasting
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
vnoremap <leader>d "+d

" easier pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quick splits
nnoremap <leader>v <C-w><C-v><C-w>l
nnoremap <leader>s <C-w><C-s><C-w>j

nnoremap <leader>/ :noh<cr>
nnoremap <leader>f :find<space>
nnoremap ? :Grep<space>""<left>

" switch between header and source files for cpp
nnoremap <leader>o :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" auto bracket pair
inoremap {<cr> {<cr>}<Esc>O

command! -nargs=+ Grep silent! grep <args> | cw | redraw!
command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>

" -- SETTINGS --
filetype off
syntax on

set nocompatible
set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set cm=blowfish2
set conceallevel=0
set expandtab

" TODO: make check for rg
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep

set hidden
set ignorecase
set incsearch
set key=
set laststatus=2
set linebreak
set listchars=tab:>·,space:·
set mouse+=a
set nobackup
set noshowmode
set noswapfile
set undodir=~/.vim/undodir
set undofile
set path+=**
set ruler
set shortmess+=I
set smartindent
set so=10
set splitbelow
set splitright
set ts=4
set sw=4
set visualbell

set wildignore+=**/Binaries/**
set wildignore+=**/Intermediate/**
set wildignore+=**/node_modules/**
set wildignore+=*.gen.*
set wildignore+=*.generated.*
set wildignore+=*.o.*
set wildignore+=*.uasset
set wildignore+=*.umap
set wildmenu

set wildoptions=pum,fuzzy
set wrap
set linebreak
set formatoptions-=cro

autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespace on save
autocmd BufReadPre *.cs set cc=160

let g:vim_json_conceal=0
let g:netrw_banner=0 " disable annoying banner
let g:netrw_liststyle=3 " tree view

if has('mac')
    colorscheme retrobox
endif

if has('win32') && has("gui_running")
    colorscheme retrobox

    au GUIEnter * simalt ~x
    highlight Cursor guifg=black guibg=orange
    highlight iCursor guifg=black guibg=orange

    set guioptions+=d
    set guicursor=n-v-c-i:block-Cursor
    set guicursor+=a:blinkon0
    set guifont=JetBrains\ Mono\ NL:h10:cANSI
    set guioptions-=T "toolbar
    set guioptions-=m "menubar
    set guioptions-=r "scrollbar
    set statusline=%<%F\ --\ %-12.(%lL\ %cC\ %P%)\ %h%m%r

    nnoremap $ g$
    nnoremap 0 g0
    nnoremap A g$a
    nnoremap j gj
    nnoremap k gk

    vnoremap $ g$
    vnoremap 0 g0
    vnoremap A g$a
    vnoremap j gj
    vnoremap k gk
endif
