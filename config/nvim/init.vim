set nocompatible
filetype off

" -------------------- Plugins --------------------
" vim-plug (:PlugInstall - https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace' " requires homebrew vim on macos
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'sheerun/vim-polyglot'
call plug#end()

" -------------------- Keybinds --------------------
let mapleader = " "

nnoremap <leader>rc :e<space>~/.config/nvim/init.vim<cr>

nnoremap k gk
nnoremap j gj
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :buf<space>
" nnoremap <leader>b :Buffers<CR>

" closes all buffers except the currently open one
nnoremap <leader>B :%bd\|e#\|bd#<cr>

" open nerdtree
nnoremap <leader>e :NERDTreeToggleVCS<cr>

" move among buffers with tab
nnoremap <tab> :bnext<cr>

" easier copying, cutting and pasting
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

" prettier use
nnoremap <leader>P <Plug>(Prettier)

" insert comments
nnoremap ,cjsx o{/*<cr>*/}<esc>0
nnoremap ,chtml o<!--<cr>--><esc>0

" better file search
nnoremap / :%s///ng<left><left><left><left>
nnoremap ? :Rg<CR>
nnoremap <leader>/ :noh<cr>

" -------------------- Settings --------------------
autocmd vimenter * ++nested colorscheme gruvbox

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
set guicursor=
set showcmd
set showcmd

set path+=**
set wildmenu
set wildoptions+=pum
set wildignore+=**/node_modules/**,**/.git/**

" tmux knows to use the extended mouse mode
if &term =~ '^screen'
    set ttymouse=xterm2
endif

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

" Get vim to use coc for it's tagfunc
set tagfunc=CocTagFunc

set rtp+=/opt/homebrew/opt/fzf

syntax on

let g:prettier#config#print_width = '120'
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#single_attribute_per_line = 'true'

let NERDTreeShowHidden=1
let NERDTreeWinSize=45
let NERDTreeMinimalUI=1

let g:airline_theme='minimalist'

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" File Browsing
let g:netrw_banner=0 " disable annoying banner
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view

" Tmux Stuff
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

