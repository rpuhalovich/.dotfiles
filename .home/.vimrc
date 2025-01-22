" --- keybinds ---
let mapleader = " "

nnoremap <leader>cfg :e<space>~\.vimrc<cr>

nnoremap s :w<cr>
vnoremap s <esc>:w<cr>
nnoremap <c-q> :q<cr>

nnoremap <leader>b :buffer<space>
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

nnoremap <leader>f :find<space>
nnoremap ? :Grep<space>""<left>

nnoremap <c-b> :make<cr>
nnoremap <leader>: :!

inoremap {<cr> {<cr>}<esc>O

if !has('nvim')
    nnoremap j gj
    vnoremap j gj
    nnoremap k gk
    vnoremap k gk
endif

" from :vert h emacs-keys
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>

nnoremap <F3> :cp<cr>
nnoremap <F4> :cn<cr>

if executable('fzf')
    function! FuzzyFind()
      let tmp = tempname()
      silent execute '!fzf>'.tmp
      if (tmp isnot v:null)
          let fname = readfile(tmp)[0]
          silent execute '!rm '.tmp
          execute 'e '.fname
      endif
      redraw!
    endfunction
    nnoremap <leader>F :call FuzzyFind()<cr>
endif

command! -nargs=+ Grep silent! grep <args> | cw 20 | redraw!
command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>

" --- sets ---
filetype on
syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set belloff=all
set conceallevel=0
set expandtab
set exrc
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -i
set hidden
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=tab:>·,space:·
set mouse+=a
set nobackup
set noshowmode
set noswapfile
set nowrap
set path+=**
set ruler
set scrolloff=10
set shiftwidth=4
set shortmess+=I
set smartindent
set smoothscroll
set splitbelow
set splitright
" set statusline=%<%F\ %-12.(%lL\ %cC\ %P%)\ %h%m%r
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set visualbell
set wildmenu
set wildoptions=pum,fuzzy

set wildignore+=**/Binaries/**
set wildignore+=**/Intermediate/**
set wildignore+=**/node_modules/**
set wildignore+=**/extern/**
set wildignore+=**/net6.0/**
set wildignore+=**/out/**
set wildignore+=*.gen.*
set wildignore+=*.generated.*
set wildignore+=*.o.*
set wildignore+=*.o
set wildignore+=*.uasset
set wildignore+=*.umap

let c_no_curly_error=1
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
    " set guifont=JetBrains\ Mono\ NL:h10:cANSI
    set guioptions-=T "toolbar
    set guioptions-=m "menubar
    set guioptions-=r "scrollbar
endif

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro " disable comments on new lines
autocmd BufNewFile,BufRead *.ht,*.ct set syntax=off
autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespace on save
autocmd FileType make setlocal noexpandtab
autocmd Filetype markdown setlocal wrap
