--- LSP ---

-- see: https://github.com/VonHeikemen/lsp-zero.nvim for default keybindings

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver',
  'clangd',
  'eslint',
  'rust_analyzer'
})

require('lspconfig').tsserver.setup({})

lsp.setup()

--- TREE SITTER ---

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "markdown", "json" },
    additional_vim_regex_highlighting = false,
  },
}

--- REMAP ---

vim.g.mapleader = " "

vim.keymap.set("n", "k", [[gk]])
vim.keymap.set("n", "j", [[gj]])

vim.keymap.set("n", "<leader>a", ":%y+<cr>")

-- Center the view when going down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>r", [[:e<space>~/.config/nvim/<cr>]])
vim.keymap.set("n", "<leader>c", [[:e<space>~/.config/nvim/cheatSheet.md<cr>]])

vim.keymap.set("n", "<leader>cl", [[:set conceallevel=0<cr>]])

-- Quick splits
vim.keymap.set("n", "<leader>v", [[<C-w><C-v><C-w>l]])
vim.keymap.set("n", "<leader>s", [[<C-w><C-s><C-w>j]])

-- Open Explorer
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>e", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<leader>e", ":e .<cr>")
vim.keymap.set('n', '<leader>q', ":bd<cr>:bnext<cr>:NERDTreeToggle<cr><c-w>l")

-- Keep cursor in place when using J
vim.keymap.set("n", "J", "mzJ`z")

-- Move among buffers with tab
vim.keymap.set("n", "<tab>", [[:bnext<cr>]])
vim.keymap.set("n", "<S-tab>", [[:bprev<cr>]])

-- Easier pane navigation
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])

-- Next and prev search results centering
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copying and pasting
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])

-- Close all buffers except open one
vim.keymap.set("n", "<leader>B", [[:Bdelete other<CR>]])

-- Better file search
vim.keymap.set("n", "<leader>/", [[:noh<cr>]])
-- vim.keymap.set("n", "?", [[:Rg<cr>]])

local telescope = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>?', builtin.live_grep, {})
vim.keymap.set('n', '?', telescope.live_grep, {})
vim.keymap.set('v', '?', "\"+y:Telescope live_grep default_text=<C-r>+<cr>", {})
vim.keymap.set('n', '<leader>f', ":Telescope find_files hidden=true<cr>", {})
vim.keymap.set('n', '<leader>gf', telescope.git_files, {})
vim.keymap.set('n', '<leader>b', telescope.buffers, {})

--- SETS ---

vim.go.conceallevel = 0

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.autochdir = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.smartindent = true

vim.opt.listchars = { space = '·', tab = '> ' }
vim.opt.list = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.laststatus = 2
vim.opt.statusline = "%<%F %h%m%r%=%-14.(%l,%c%V%) %P"

vim.g.mapleader = " "

vim.opt.path:append("**")

-- Disable quote concealing in JSON files
vim.g.vim_json_conceal = 0

-- Netrw stuff
vim.g.netrw_banner = 0 -- disable annoying banner
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_keepdir = 0 -- lets copy and move

-- NERDTree stuff
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 40
vim.g.NERDTreeMouseMode = 3
vim.g.NERDTreeMinimalUI = 1
