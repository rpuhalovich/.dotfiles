set nocompatible
filetype off

" -------------------- Plugins --------------------
if has("gui_running") " detect if gvim
call plug#begin()
    Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
end

" -------------------- Keybinds --------------------
let mapleader = " "
set wildcharm=<C-z> " for tab completion in maps

nnoremap <leader>r :e<space>~\.vimrc<cr>

nnoremap k gk
nnoremap j gj

nnoremap <leader>b :buffer<space><c-z>
nnoremap <leader>B mm:%bd\|e#\|bd#<cr>`m

nnoremap <leader>a :%y+<cr>

nnoremap <leader>e :Ex<cr>
nnoremap <leader>f :find<space>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" move among buffers with tab
nnoremap <tab> :bnext<cr>
nnoremap <S-tab> :bprev<cr>

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

" quick vertical split
nnoremap <leader>v <C-w><C-v><C-w>l

" insert comments
nnoremap <leader>cxml o<!--<cr>--><esc>0

" better file searching
" nnoremap / :%s///ng<left><left><left><left>
nnoremap ? :<C-f>ivimgrep<space>""<space>**<space>\|<space>copen<esc>0f"a

" clear highlighting for search term
nnoremap <leader>/ :noh<cr>:<esc>

" auto pairs
inoremap {<cr> {<cr>}<Esc>O

" entering braces
nnoremap <leader>nb i{<cr><esc>o}<esc>k_

" -------------------- Settings --------------------
colorscheme slate

if has("gui_running")
au GUIEnter * simalt ~x
end

set noundofile
set noswapfile
set nobackup
set number
set relativenumber
set expandtab
set nowrap
set linebreak nolist
set so=10
set ts=4 sw=4
set ruler
set visualbell
set noerrorbells
set hidden
set nohlsearch
" set colorcolumn=120
set noshowmode
set cursorline
set ignorecase
set mouse+=a
set splitbelow splitright
set belloff=all

set path+=**
set wildmenu
set wildoptions+=pum
set wildignore+=**/node_modules/**,**/.git/**

set guifont=Consolas:h12:cANSI

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=a:blinkon0

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

" set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=m  "scrollbar

set listchars=tab:>·,space:·

" disable automatic commenting on newlines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

syntax on

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" File Browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_liststyle=3 " tree view
