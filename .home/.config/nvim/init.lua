vim.cmd([[so ~/.vimrc]])
vim.cmd([[nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/<cr>]])
vim.cmd([[set fillchars+=vert:\|]])

vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.signcolumn = "yes"
vim.opt.statusline = "%<%F -- %-12.(%lL %cC %P%) %h%m%r"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir-nvim"

-- LSP --
-- see: https://github.com/VonHeikemen/lsp-zero.nvim for default keybindings
local lsp = require("lsp-zero").preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.default_keymaps({ buffer = bufnr, omit = {'<cr>'} })

lsp.configure('tsserver', {})
lsp.setup()
