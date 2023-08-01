-- REMAPS --
vim.g.mapleader = " "

vim.keymap.set("n", "k", [[gk]])
vim.keymap.set("n", "j", [[gj]])
vim.keymap.set("n", "A", [[g$a]])
vim.keymap.set("n", "$", [[g$]])
vim.keymap.set("n", "0", [[g0]])

vim.keymap.set("n", "<leader>a", ":%y+<cr>")

-- Center the view when going down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>cfg", [[:e<space>~/.config/nvim/<cr>]])
vim.keymap.set("n", "<leader>c", [[:e<space>~/.dotfiles/.cheatsheets/nvim.md<cr>]])

-- Quick splits
vim.keymap.set("n", "<leader>v", [[<C-w><C-v><C-w>l]])
vim.keymap.set("n", "<leader>s", [[<C-w><C-s><C-w>j]])

-- Open Explorer
vim.keymap.set("n", "<leader>e", ":e .<cr>")

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
vim.keymap.set({"n", "v"}, "<leader>yy", [[mm_v$h"+y`m]])
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
vim.keymap.set({"n", "v"}, "<leader>dd", [[mm_v$h"+y`mdd]])

-- Close all buffers except open one
vim.keymap.set("n", "<leader>B", [[:Bdelete other<CR>]])

-- Better file search
vim.keymap.set("n", "<leader>/", [[:noh<cr>]])
vim.keymap.set("n", "?", [[:Telescope live_grep preview=true hidden=true<cr>]], {})
vim.keymap.set("v", "?", [["zy:Telescope live_grep preview=true hidden=true default_text=<C-r>z<cr>]], {})
vim.keymap.set("n", "<leader>f", [[:Telescope find_files hidden=true<cr>]], {})
vim.keymap.set("n", "<leader>F", [[:find ]], {})
vim.keymap.set("n", "<leader>gf", [[:Telescope git_files hidden=true<cr>]], {})
vim.keymap.set("n", "<leader>b", [[:Telescope buffers hidden=true<cr>]], {})

-- Symbols Outline
vim.keymap.set("n", "<leader>o", [[:SymbolsOutline<cr>W]], {})

-- Rename symbol: https://www.reddit.com/r/neovim/comments/rustfp/how_to_config_nvimlspconfig_to_rename_a_variable/
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- Git Messenger/Blamer
vim.keymap.set("n", "gb", [[:BlamerToggle<cr>]], {})

-- Prettier
vim.keymap.set("n", "<leader>P", [[:Prettier<cr>]], {})

-- Quick newline args
vim.keymap.set("n", "<leader>n", [[f,lxi<cr><esc>]], {})

vim.keymap.set("n", "<up>", "<up><cr><c-w>p")
vim.keymap.set("n", "<down>", "<down><cr><c-w>p")

-- SNIPPETS --
vim.keymap.set("n", ",ls", [[oLOG("%s", *FString(""));<esc>F"i]])

-- SETS --
vim.g.mapleader = " "

vim.g.vim_json_conceal = 0
vim.go.conceallevel = 0
vim.o.background = "dark"
vim.opt.autochdir = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.colorcolumn = ""
vim.opt.cursorline = true
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
vim.opt.nu = true
vim.opt.path:append("**")
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.statusline = "%<%F %h%m%r%=%-16.(%l,%c%V%) %P"
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wildignore:append("**/node_modules/**")
vim.opt.wrap = true

-- relative number only in the active window
local cmd = vim.cmd
cmd [[
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
    augroup END
]]

-- NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeMouseMode = 3
vim.g.NERDTreeShowHidden = 1
-- vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeWinSize = 41
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '-'

-- BLAMER --
vim.g.blamer_delay = 100
vim.g.blamer_show_in_visual_modes = 0

-- ILLUMINATE --
require("illuminate").configure({ delay = 100 })

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

-- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end
})

-- LSP --
-- see: https://github.com/VonHeikemen/lsp-zero.nvim for default keybindings
local lsp = require("lsp-zero").preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.ensure_installed({
    "tsserver",
    "clangd",
    "eslint"
})

lsp.configure('tsserver', {})

lsp.setup()

-- SYMBOLS OUTLINE --
require("symbols-outline").setup({
    position = "bottom",
    width = 35,
    autofold_depth = 0,
    keymaps = {
        focus_location = "<cr>"
    }
})

-- TREE SITTER --
require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "markdown", "json" },
        additional_vim_regex_highlighting = false,
    },
}

-- GRUVBOX --
require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        Visual = { bg = "#383838" }
    }
})

vim.cmd("colorscheme gruvbox")

-- TELESCOPE --
require("telescope").setup{
    defaults = {
        file_ignore_patterns = { "^node_modules/", "^.git/" },
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
        preview = false,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case=false",
        }
    },
}
