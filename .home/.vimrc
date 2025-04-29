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

nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

" easier copying and pasting
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>y "+y
vnoremap <leader>Y "+Y
vnoremap <leader>d "+d

" easier pane navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" quick splits
nnoremap <leader>v <c-w><c-v><c-w>l
nnoremap <leader>s <c-w><c-s><c-w>j

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
cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-e> <end>
cnoremap <c-f> <right>
cnoremap <c-k> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos() - 2]<cr>

nnoremap <F3> :cp<cr>
nnoremap <F4> :cn<cr>

if executable('ctags')
    nnoremap <leader>t :!ctags -R .<cr><cr>
endif

command! -nargs=+ Grep silent! grep <args> | cw 20 | redraw!
command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>

" --- sets ---
filetype on
syntax on

if executable('rg')
    set grepprg=rg\ --vimgrep\ -i
    set grepformat=%f:%l:%c:%m
endif

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set belloff=all
set conceallevel=0
set expandtab
set exrc
set hidden
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=tab:>·,space:·
set mouse+=a
set nobackup
set noshowcmd
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
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set visualbell
set wildmenu
set wildoptions=tagfile,pum,fuzzy

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

if has('win32') && has("gui_running")
    autocmd GUIEnter * simalt ~x

    highlight Cursor guifg=black guibg=orange
    highlight iCursor guifg=black guibg=orange

    set guifont=Fixedsys:h14

    set guioptions+=d
    set guicursor=n-v-c-i:block-Cursor
    set guicursor+=a:blinkon0
    set guioptions-=T "toolbar
    set guioptions-=m "menubar
    set guioptions-=r "scrollbar
endif

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro " disable comments on new lines
autocmd BufNewFile,BufRead *.ht,*.ct set syntax=off
autocmd BufWritePre * %s/\s\+$//e " delete trailing whitespace on save
autocmd FileType make setlocal noexpandtab
autocmd Filetype markdown setlocal wrap

if has('mac') || has('win32') && has("gui_running")
    " modified from retrobox.vim

    hi clear
    let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)

    hi! link CursorColumn CursorLine
    hi! link StatusLineTerm StatusLine
    hi! link StatusLineTermNC StatusLineNC
    hi! link VisualNOS Visual
    hi! link Tag Special
    hi! link lCursor Cursor
    hi! link MessageWindow PMenu
    hi! link PopupNotification Todo
    hi! link CurSearch IncSearch
    hi! link Terminal Normal

    hi Normal ctermfg=187 ctermbg=black cterm=NONE
    hi CursorLineNr ctermfg=214 ctermbg=black cterm=bold
    hi FoldColumn ctermfg=102 ctermbg=black cterm=NONE
    hi SignColumn ctermfg=102 ctermbg=black cterm=NONE
    hi VertSplit ctermfg=236 ctermbg=black cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=16 cterm=NONE
    hi Comment ctermfg=102 ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE
    hi Error ctermfg=203 ctermbg=black cterm=bold,reverse
    hi ErrorMsg ctermfg=232 ctermbg=203 cterm=bold
    hi Folded ctermfg=102 ctermbg=black cterm=NONE
    hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
    hi MatchParen ctermfg=NONE ctermbg=239 cterm=bold,underline
    hi NonText ctermfg=239 ctermbg=NONE cterm=NONE
    hi Pmenu ctermfg=187 ctermbg=237 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=237 cterm=NONE
    hi PmenuSel ctermfg=237 ctermbg=109 cterm=bold
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi PmenuKind ctermfg=203 ctermbg=237 cterm=NONE
    hi PmenuKindSel ctermfg=203 ctermbg=109 cterm=NONE
    hi PmenuExtra ctermfg=102 ctermbg=237 cterm=NONE
    hi PmenuExtraSel ctermfg=236 ctermbg=109 cterm=NONE
    hi PmenuMatch ctermfg=132 ctermbg=237 cterm=NONE
    hi PmenuMatchSel ctermfg=132 ctermbg=109 cterm=bold
    hi SpecialKey ctermfg=102 ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=187 ctermbg=234 cterm=NONE
    hi StatusLineNC ctermfg=187 ctermbg=234 cterm=NONE
    hi TabLine ctermfg=102 ctermbg=237 cterm=NONE
    hi TabLineFill ctermfg=187 ctermbg=237 cterm=NONE
    hi TabLineSel ctermfg=230 ctermbg=black cterm=bold
    hi ToolbarButton ctermfg=230 ctermbg=236 cterm=bold
    hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Visual ctermfg=232 ctermbg=109 cterm=NONE
    hi WildMenu ctermfg=109 ctermbg=239 cterm=bold
    hi EndOfBuffer ctermfg=239 ctermbg=NONE cterm=NONE
    hi Conceal ctermfg=239 ctermbg=NONE cterm=NONE
    hi Cursor ctermfg=232 ctermbg=230 cterm=NONE
    hi DiffAdd ctermfg=142 ctermbg=black cterm=reverse
    hi DiffChange ctermfg=107 ctermbg=black cterm=reverse
    hi DiffDelete ctermfg=203 ctermbg=black cterm=reverse
    hi DiffText ctermfg=214 ctermbg=black cterm=reverse
    hi Directory ctermfg=142 ctermbg=NONE cterm=bold
    hi IncSearch ctermfg=208 ctermbg=black cterm=reverse
    hi ModeMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi MoreMsg ctermfg=214 ctermbg=NONE cterm=bold
    hi Question ctermfg=208 ctermbg=NONE cterm=bold
    hi Search ctermfg=100 ctermbg=black cterm=reverse
    hi QuickFixLine ctermfg=107 ctermbg=black cterm=reverse
    hi SpellBad ctermfg=203 ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=109 ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=107 ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=175 ctermbg=NONE cterm=underline
    hi Title ctermfg=142 ctermbg=NONE cterm=bold
    hi WarningMsg ctermfg=203 ctermbg=NONE cterm=bold
    hi Boolean ctermfg=175 ctermbg=NONE cterm=NONE
    hi Character ctermfg=175 ctermbg=NONE cterm=NONE
    hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
    hi Constant ctermfg=175 ctermbg=NONE cterm=NONE
    hi Define ctermfg=107 ctermbg=NONE cterm=NONE
    hi Debug ctermfg=203 ctermbg=NONE cterm=NONE
    hi Delimiter ctermfg=208 ctermbg=NONE cterm=NONE
    hi Error ctermfg=203 ctermbg=black cterm=bold,reverse
    hi Exception ctermfg=203 ctermbg=NONE cterm=NONE
    hi Float ctermfg=175 ctermbg=NONE cterm=NONE
    hi Function ctermfg=142 ctermbg=NONE cterm=bold
    hi Identifier ctermfg=109 ctermbg=NONE cterm=NONE
    hi Ignore ctermfg=fg ctermbg=NONE cterm=NONE
    hi Include ctermfg=107 ctermbg=NONE cterm=NONE
    hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
    hi Label ctermfg=203 ctermbg=NONE cterm=NONE
    hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
    hi Number ctermfg=175 ctermbg=NONE cterm=NONE
    hi Operator ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreCondit ctermfg=107 ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=107 ctermbg=NONE cterm=NONE
    hi Repeat ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialChar ctermfg=203 ctermbg=NONE cterm=NONE
    hi SpecialComment ctermfg=203 ctermbg=NONE cterm=NONE
    hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
    hi StorageClass ctermfg=208 ctermbg=NONE cterm=NONE
    hi Special ctermfg=208 ctermbg=NONE cterm=NONE
    hi String ctermfg=142 ctermbg=NONE cterm=NONE
    hi Structure ctermfg=107 ctermbg=NONE cterm=NONE
    hi Todo ctermfg=fg ctermbg=black cterm=bold
    hi Type ctermfg=214 ctermbg=NONE cterm=NONE
    hi Typedef ctermfg=214 ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=109 ctermbg=NONE cterm=underline
    hi CursorIM ctermfg=232 ctermbg=230 cterm=NONE
endif
