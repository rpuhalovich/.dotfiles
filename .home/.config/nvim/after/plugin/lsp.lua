local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
    "rust_analyzer",
    "clangd",
})

-- Fix Undefined global "vim"
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

-- this file is needed for clangd: ~/Library/Preferences/clangd/config.yaml
-- add the following:
-- ```
-- CompileFlags:
--   Add: [ -std=c++20, -I/opt/homebrew/Cellar/gcc/12.2.0/include/c++/12/aarch64-apple-darwin21 ]
-- ```
lsp.configure("clangd", {
    cmd = {
        "/usr/bin/clangd",
        "--enable-config",
        "--background-index",
        "--header-insertion=never",
    }
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = { error = "E", warn = "W", hint = "H", info = "I" }
})

lsp.setup()
-- vim.diagnostic.config({ virtual_text = true })
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
