" --- keybinds ---
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

" quick switch between h and cpp
nnoremap <leader>o :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr>

inoremap {<cr> {<cr>}<Esc>O

if !has('nvim')
    nnoremap j gj
    vnoremap j gj
    nnoremap k gk
    vnoremap k gk
endif

command! -nargs=+ Grep silent! grep <args> | cw 20 | redraw!
command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>

" from :vert h emacs-keys
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

" --- sets ---
filetype off
syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set conceallevel=0
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -i
set hidden
set ignorecase
set incsearch
set laststatus=2
set linebreak
set linebreak
set listchars=tab:>·,space:·
set mouse+=a
set nobackup
set noshowmode
set noswapfile
set path+=**
set ruler
set shortmess+=I
set smartindent
set smoothscroll
set so=10
set splitbelow
set splitright
set statusline=%<%F\ --\ %-12.(%lL\ %cC\ %P%)\ %h%m%r
set sw=4
set ts=4
set undodir=~/.vim/undodir
set undofile
set visualbell
set wildignore+=**/Binaries/**
set wildignore+=**/Intermediate/**
set wildignore+=**/node_modules/**
set wildignore+=**/net6.0/**
set wildignore+=**/out/**
set wildignore+=*.gen.*
set wildignore+=*.generated.*
set wildignore+=*.o.*
set wildignore+=*.uasset
set wildignore+=*.umap
set wildmenu
set wildoptions=pum,fuzzy
set wrap

autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespace on save

" disable comments on new lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

let g:vim_json_conceal=0
let g:netrw_banner=0
let g:netrw_liststyle=1

if has('mac')
    colorscheme retrobox
endif

if has('win32') && has("gui_running")
    colorscheme retrobox

    autocmd GUIEnter * simalt ~x

    highlight Cursor guifg=black guibg=orange
    highlight iCursor guifg=black guibg=orange

    set guioptions+=d
    set guicursor=n-v-c-i:block-Cursor
    set guicursor+=a:blinkon0
    set guifont=JetBrains\ Mono\ NL:h10:cANSI
    set guioptions-=T "toolbar
    set guioptions-=m "menubar
    set guioptions-=r "scrollbar
endif
