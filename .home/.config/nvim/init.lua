vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

vim.lsp.enable('roslyn_ls', {
    cmd = "dotnet /Users/ryanpuhalovich/.scripts-local/Microsoft.CodeAnalysis.LanguageServer-dll/Microsoft.CodeAnalysis.LanguageServer.dll --logLevel Information"
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.lsp.document_color.enable(false, args.buf) -- Disable document colors
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.cmd([[
autocmd FileType cs nnoremap <c-]> <cmd>lua require('roslyn_ls').lsp_definition()<cr>
autocmd FileType cs nnoremap gi <cmd>lua require('roslyn_ls').lsp_implementation()<cr>
autocmd FileType cs nnoremap gr <cmd>lua require('roslyn_ls').lsp_references()<cr>
autocmd FileType cs nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>
autocmd FileType cs set signcolumn=yes
autocmd FileType cs set colorcolumn=160
autocmd FileType cs set errorformat=\ %#%f(%l\\\,%c):\ %m
autocmd FileType cs set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly
]])

vim.cmd([[
so ~/.vimrc
]])
