set nocompatible
filetype off

" KEYBINDS
let mapleader = " "
set wildcharm=<c-z> " for tab completion in maps

nnoremap <leader>cfg :e<space>~\.vimrc<cr>

inoremap <C-p> <up>
inoremap <C-n> <down>
nnoremap <C-p> <up>
nnoremap <C-n> <down>

nnoremap s :w<cr>
vnoremap s <esc>:w<cr>
nnoremap <c-q> :q<cr>

nnoremap <leader>b :buffer<space><c-z>
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

command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>
command! MakeTags !ctags<space>-R<space>.

" SETTINGS
syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set cm=blowfish2
set conceallevel=0
set expandtab
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep
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
set nohlsearch
set noshowmode
set noswapfile
set noundofile
set path+=**
set ruler
set shortmess+=I
set smartindent
set so=10
set splitbelow splitright
set statusline=%<%F\ --\ %-12.(%lL\ %cC\ %P%)\ %h%m%r
set ts=4 sw=4
set visualbell
set wildignore+=**/node_modules/**
set wildmenu
set wildoptions=pum,fuzzy
set wrap linebreak

autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespace on save
autocmd FileType * set formatoptions-=cro " never add comment on newline

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

    set cc=160

    set guioptions+=d
    set guicursor=n-v-c-i:block-Cursor
    set guicursor+=a:blinkon0
    set guifont=JetBrains\ Mono\ NL:h10:cANSI
    set guioptions-=T "toolbar
    set guioptions-=m "menubar
    set guioptions-=r "scrollbar

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

if filereadable($VIMRUNTIME . '\autoload\plug.vim') || filereadable($VIMRUNTIME . '/autoload/plug.vim')
    " " Generated by vim-plug
    " " Tue  6 Aug 19:50:50 2024
    " " :source this file in vim to restore the snapshot
    " " or execute: vim -S snapshot.vim
    "
    " silent! let g:plugs['fzf'].commit = 'ccc46772525f8cbfbd3f1b836d43e07ec181c266'
    " silent! let g:plugs['fzf.vim'].commit = 'c311c0a95fc2529c26ab36a8f530e9dd4426304c'
    "
    " PlugUpdate!

    call plug#begin()
    Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
    Plug 'junegunn/fzf.vim'
    call plug#end()

    let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.9}}
    let g:fzf_vim = {}
    let g:fzf_vim.preview_window = ['down,50%']

    let rgcmd = 'rg --column --line-number --no-heading --color=always --smart-case -g !tags --hidden .'
    command! -bang -nargs=* Buffers call fzf#vim#buffers('.', {'options': ['--layout=reverse']}, 0)
    command! -bang -nargs=* Files call fzf#vim#files('.', {'options': ['--layout=reverse']}, 0)
    command! -bang -nargs=* GFiles call fzf#vim#files('.', {'source': 'git ls-files', 'options': ['--layout=reverse']}, 0)
    command! -bang -nargs=* Rg call fzf#vim#grep(rgcmd, 1, fzf#vim#with_preview({'options': ['--layout=reverse', '--preview-window=down,50%']}), 0)

    nnoremap <leader>b :Buffers<cr>
    nnoremap ? :Rg<cr>

    if isdirectory($PWD . '\.git') || isdirectory($PWD . '/.git')
        nnoremap <leader>f :GFiles<cr>
    else
        nnoremap <leader>f :Files<cr>
    endif
endif
