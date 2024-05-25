-- REMAPS --
vim.g.mapleader = " "

vim.keymap.set("n", "$", [[g$]])
vim.keymap.set("n", "0", [[g0]])
-- vim.keymap.set("n", "A", [[g$a]])
vim.keymap.set("n", "j", [[gj]])
vim.keymap.set("n", "k", [[gk]])
vim.keymap.set("v", "$", [[g$]])
vim.keymap.set("v", "0", [[g0]])
vim.keymap.set("v", "A", [[g$a]])
vim.keymap.set("v", "j", [[gj]])
vim.keymap.set("v", "k", [[gk]])

-- Copy Whole File
vim.keymap.set("n", "<leader>a", [[:%y+<cr>]])

-- Quick Save
vim.keymap.set("n", "s", [[:w<cr>]])

-- Quick Quit
vim.keymap.set("n", "<c-q>", [[:q<cr>]])

-- Center the view when going down and up
vim.keymap.set("n", "<C-d>", [[<C-d>zz]])
vim.keymap.set("n", "<C-u>", [[<C-u>zz]])
vim.keymap.set("v", "<C-d>", [[<C-d>zz]])
vim.keymap.set("v", "<C-u>", [[<C-u>zz]])

vim.keymap.set("n", "<leader>cfg", [[:e<space>~/.config/nvim/<cr>]])
vim.keymap.set("n", "<leader>c", [[:e<space>~/.dotfiles/.cheatsheets/nvim.md<cr>]])

-- Quick splits
vim.keymap.set("n", "<leader>v", [[<C-w><C-v><C-w>l]])
vim.keymap.set("n", "<leader>s", [[<C-w><C-s><C-w>j]])

-- Auto Pairs
vim.keymap.set("i", "{<cr>", [[{<cr>}<Esc>O]])

-- Open Explorer
vim.keymap.set("n", "<leader>e", [[:e .<cr>]])

-- Easier pane navigation
vim.keymap.set("n", "<C-h>", [[<C-w>h]])
vim.keymap.set("n", "<C-j>", [[<C-w>j]])
vim.keymap.set("n", "<C-k>", [[<C-w>k]])
vim.keymap.set("n", "<C-l>", [[<C-w>l]])

-- Next and prev search results centering
vim.keymap.set("n", "n", [[nzzzv]])
vim.keymap.set("n", "N", [[Nzzzv]])

-- Copying and pasting
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])

-- Close all buffers except open one
vim.keymap.set("n", "<leader>B", [[:%bd|e#<cr>]])

-- Better file search
vim.keymap.set("n", "<leader>/", [[:noh<cr>]])
vim.keymap.set("n", "?", [[:call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden .", fzf#vim#with_preview())<cr>]])
vim.keymap.set("n", "<leader>f", [[:Files<cr>]])
vim.keymap.set("n", "<leader>b", [[:Buffers<cr>]])

-- Symbols Outline
vim.keymap.set("n", "go", [[:SymbolsOutline<cr>W]])

-- Rename symbol
vim.keymap.set("n", "<leader>r", [[<cmd>lua vim.lsp.buf.rename()<cr>]], { noremap = true })

-- Git Blame
vim.keymap.set("n", "gb", [[:G blame<cr>]])

-- Quick newline args
vim.keymap.set("n", "<leader>n", [[f,lxi<cr><esc>]])

-- SNIPPETS --
vim.keymap.set("n", ",ls", [[oLOG("%s", *FString(""));<esc>F"i]])
vim.keymap.set("n", ",mlc", [[j:-1read ~/.config/nvim/snippets/mlc<cr>kjjA<space>]])

-- NeoFormat
vim.cmd([[command! -nargs=0 Prettier :Neoformat prettier]])

-- Tab size switching
vim.cmd([[command! -nargs=1 Tab noautocmd set ts=<args> sw=<args>]])

vim.cmd([[let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""']])

-- SETS --
vim.g.mapleader = " "

-- vim.opt.number = true
-- vim.opt.relativenumber = true

vim.opt.statusline = "%<%F -- %-12.(%lL %cC %P%) %h%m%r"

vim.g.vim_json_conceal = 0
vim.go.conceallevel = 0
vim.o.background = "dark"
vim.opt.autochdir = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.colorcolumn = ""
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.listchars = { space = "·", tab = "> " }
vim.opt.mousemodel = "extend"
vim.opt.path:append("**")
vim.opt.ruler = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showcmd = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
-- vim.opt.tw = 72
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wildignore:append("**/node_modules/**")
vim.opt.wrap = true

-- use pipe character for vertical split
vim.cmd([[set fillchars+=vert:\|]])

-- no auto comments anywhere
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

-- remove trailing whitespace on save
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeMouseMode = 3
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 40
vim.g.NERDTreeHighlightCursorline = 0
vim.g.NERDTreeDirArrowExpandable = '|'
vim.g.NERDTreeDirArrowCollapsible = '|'

-- NeoFormat
vim.g.neoformat_try_node_exe = 1

-- BLAMER --
vim.g.blamer_delay = 100
vim.g.blamer_show_in_visual_modes = 0

-- LSP --
-- see: https://github.com/VonHeikemen/lsp-zero.nvim for default keybindings
local lsp = require("lsp-zero").preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.default_keymaps({
  buffer = bufnr,
  omit = {'<cr>'}
})

lsp.ensure_installed({
    "tsserver",
    "eslint"
})

lsp.configure('tsserver', {})

lsp.setup()

-- SYMBOLS OUTLINE --
require("symbols-outline").setup({
    position = "bottom",
    width = 35,
    autofold_depth = 0,
    auto_unfold_hover = false,
    keymaps = {
        focus_location = "<cr>"
    }
})

-- TREE SITTER --
require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "markdown", "json" },
        additional_vim_regex_highlighting = false
    }
})

-- GRUVBOX --
local backgroundColour = "#1C1C1C"
local highlightColour = "#383838"
local statuslineColor = "#282828"

require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        Visual = { bg = highlightColour },
        StatusLine = { fg = statuslineColor },
        SignColumn = { bg = backgroundColour },
        DiagnosticError = { bg = backgroundColour },
        DiagnosticSignError = { bg = backgroundColour },
        DiagnosticSignHint = { bg = backgroundColour },
        DiagnosticSignInfo = { bg = backgroundColour },
        DiagnosticSignWarn = { bg = backgroundColour }
    }
})

vim.cmd("colorscheme gruvbox")
