vim.cmd([[
so ~/.vimrc

nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/<cr>

set fillchars+=vert:\|

" autocmd BufReadPre *.cs set cc=160
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%160v.\+/

set errorformat=\ %#%f(%l\\\,%c):\ %m
set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly

nnoremap <leader>F :call fzf#vim#files('.', {'window': { 'width': 0.9, 'height': 0.9 }})<cr>

augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]])

vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.signcolumn = "yes"
vim.opt.statusline = "%<%F %{FugitiveStatusline()} -- %-12.(%lL %cC %P%) %h%m%r"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir-nvim"
vim.opt.wrap = false

-- LSP --
-- see: https://github.com/VonHeikemen/lsp-zero.nvim for default keybindings
local lsp = require("lsp-zero").preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false
})

lsp.default_keymaps({ buffer = bufnr, omit = {'<cr>'} })

vim.cmd([[
autocmd FileType cs nnoremap <c-]> <cmd>lua require('omnisharp_extended').lsp_definition()<cr>
autocmd FileType cs nnoremap gi <cmd>lua require('omnisharp_extended').lsp_implementation()<cr>
autocmd FileType cs nnoremap gr <cmd>lua require('omnisharp_extended').lsp_references()<cr>
]])

lsp.setup()
