vim.g.mapleader = " "

vim.keymap.set("n", "k", [[gk]])
vim.keymap.set("n", "j", [[gj]])

-- Center the view when going down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>r", [[:e<space>~/.config/nvim/<cr>]])
-- vim.keymap.set("n", "<leader>f", [[:Files<CR>]])
-- vim.keymap.set("n", "<leader>b", [[:Buffers<CR>]])

-- Quick splits
vim.keymap.set("n", "<leader>v", [[<C-w><C-v><C-w>l]])
vim.keymap.set("n", "<leader>s", [[<C-w><C-s><C-w>j]])

-- Open Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

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
vim.keymap.set("n", "<leader>B", [[mM:%bd\|e#\|bd#<cr>'M]])

-- Better file search
vim.keymap.set("n", "/", [[:%s///ng<left><left><left><left>]])
vim.keymap.set("n", "<leader>/", [[:noh<cr>]])
-- vim.keymap.set("n", "?", [[:Rg<CR>]])
