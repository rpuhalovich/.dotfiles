vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

vim.lsp.enable('roslyn_ls')
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.lsp.get_client_by_id(args.data.client_id).server_capabilities.semanticTokensProvider = nil
  end,
})

local function on_list(options)
  vim.fn.setqflist({}, ' ', options)
  vim.cmd.cfirst()
end

vim.cmd([[
autocmd FileType cs nnoremap gi <cmd>lua vim.lsp.buf.implementation({})<cr>
autocmd FileType cs nnoremap gr <cmd>lua vim.lsp.buf.references(nil, {})<cr>
autocmd FileType cs nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>
autocmd FileType cs set signcolumn=yes
autocmd FileType cs set colorcolumn=160
autocmd FileType cs set errorformat=\ %#%f(%l\\\,%c):\ %m
autocmd FileType cs set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly
so ~/.vimrc
]])
