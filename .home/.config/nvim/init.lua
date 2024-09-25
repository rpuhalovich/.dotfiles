vim.cmd([[
so ~/.vimrc

nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/<cr>

set fillchars+=vert:\|
]])

vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.signcolumn = "yes"
vim.opt.statusline = "%<%F -- %-12.(%lL %cC %P%) %h%m%r"
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

vim.cmd([[
autocmd BufReadPre *.cs set cc=160
]])
