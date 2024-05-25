set nocompatible
filetype off

" -------------------- Keybinds --------------------
let mapleader = " "
set wildcharm=<C-z> " for tab completion in maps

nnoremap <leader>cfg :e<space>~\.vimrc<cr>

nnoremap $ g$
nnoremap 0 g0
" nnoremap A g$a
nnoremap j gj
nnoremap k gk

nnoremap s :w<cr>
nnoremap <c-q> :q<cr>

nnoremap <leader>b :buffer<space><c-z>
nnoremap <leader>B mm:%bd\|e#\|bd#<cr>`m

nnoremap <leader>a :%y+<cr>

nnoremap <leader>e :Ex<cr>

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

" clear highlighting for search term
nnoremap <leader>/ :noh<cr>

nnoremap <Down> <Down><CR><C-w>p
nnoremap <Up> <Up><CR><C-w>p

" auto pair curly brackets
inoremap {<cr> {<cr>}<Esc>O

command! -nargs=1 Grep noautocmd vimgrep /<args>/gj ** | cw
nnoremap ? :Grep<space>
nnoremap <leader>f :find<space>

command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>

" -------------------- Settings --------------------
syntax on

" set nu rnu

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set cm=blowfish2
set conceallevel=0
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set key=
set laststatus=2
set linebreak nolist
set listchars=tab:>·,space:·
set mouse+=a
set nobackup
set noerrorbells
set nohlsearch
set noshowmode
set noswapfile
set noundofile
set path+=**
set ruler
set smartindent
set so=10
set splitbelow splitright
set ts=4 sw=4
" set tw=72
set visualbell
set wildignore+=**/node_modules/**
set wildoptions=pum
set wildmenu
set wildoptions=pum
set wrap linebreak

if has("unix")
    colorscheme retrobox
endif

if has("gui_running")
    colorscheme retrobox
    au GUIEnter * simalt ~x
    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c-i:hor25-Cursor
    set nonu nornu
    set guicursor+=a:blinkon0
    set guifont=Consolas:h12:cANSI
    set guioptions-=T  "toolbar
    set guioptions-=r  "scrollbar
    " set guioptions-=m  "scrollbar
endif

" delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

let g:vim_json_conceal=0

" File Browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_liststyle=3 " tree view
