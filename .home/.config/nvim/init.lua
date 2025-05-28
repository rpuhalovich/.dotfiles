vim.cmd([[
so ~/.vimrc

nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/<cr>

set fillchars+=vert:\|

autocmd BufReadPre *.cs set colorcolumn=160

set errorformat=\ %#%f(%l\\\,%c):\ %m
set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly

" set background=light
" colorscheme default

nnoremap <leader>F :call fzf#vim#files('.', {'window': { 'width': 0.9, 'height': 0.9 }})<cr>
nnoremap <leader>n mm:bufdo set nu<cr>`m

autocmd BufEnter * set formatoptions-=cro
autocmd BufEnter * setlocal formatoptions-=cro
]])

vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.signcolumn = "yes"
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end
})

lsp.setup()
