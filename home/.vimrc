set nocompatible
filetype off

" -------------------- Keybinds --------------------
let mapleader = " "

nnoremap <leader>rc :e<space>~/.vimrc<cr>

nnoremap k gk
nnoremap j gj
nnoremap <leader>b :buf<space>
nnoremap <leader>B :%bd\|e#\|bd#<cr>

nnoremap <leader>e :Sex<cr>
nnoremap <leader>f :find<space>

" move among buffers with tab
map <tab> :bnext<cr>
map <leader><tab> :bprev<cr>

" easier copying and pasting
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d

" easier pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quick vertical split
nnoremap <leader>v <C-w><C-v><C-w>l

" insert comments
nnoremap <leader>cxml o<!--<cr>--><esc>0

" better file searching
nnoremap / :%s///ng<left><left><left><left>
nnoremap ? :<C-f>ivimgrep<space>""<space>**<space>\|<space>copen<esc>0f"a

" clear highlighting for search term
nnoremap <leader>/ :noh<cr>

" -------------------- Settings --------------------
colorscheme slate

set noundofile
set noswapfile
set nobackup
set number
set expandtab
set wrap linebreak nolist
set so=10
set ts=2 sw=2
set ruler
set visualbell
set noerrorbells
set hidden
set nohlsearch
set colorcolumn=120
set noshowmode
set cursorline
set ignorecase
set mouse+=a
set splitbelow splitright

set path+=**
set wildmenu
set wildoptions+=pum
set wildignore+=**/node_modules/**,**/.git/**

" Show status and show path
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Make backspace work like in most other editors
set backspace=indent,eol,start

" Highlight search results
set hlsearch
set incsearch

" auto + smart indent for code
set autoindent
set smartindent

set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=m  "scrollbar

" disable automatic commenting on newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

syntax on

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" File Browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
