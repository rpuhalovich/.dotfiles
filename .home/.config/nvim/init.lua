-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { "Hoffs/omnisharp-extended-lsp.nvim", lazy = false },
    { "neovim/nvim-lspconfig", lazy = false },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- LSP
function omnisharplsp()
  -- from https://github.com/neovim/nvim-lspconfig
  local util = require 'lspconfig.util'
  return {
    cmd = {
      '/Users/ryanpuhalovich/omnisharp-lsp-net6/OmniSharp', -- config this to your own install of omnisharp-lsp-net6
      '-z', -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
      '--hostPID',
      tostring(vim.fn.getpid()),
      'DotNet:enablePackageRestore=false',
      '--encoding',
      'utf-8',
      '--languageserver',
    },
    filetypes = { 'cs', 'vb' },
    root_dir = function(bufnr, on_dir)
      local fname = vim.api.nvim_buf_get_name(bufnr)
      on_dir(
        util.root_pattern '*.sln'(fname)
          or util.root_pattern '*.csproj'(fname)
          or util.root_pattern 'omnisharp.json'(fname)
          or util.root_pattern 'function.json'(fname))
    end,
    init_options = {},
    capabilities = {
      workspace = {
        workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
      },
    },
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = true,
        OrganizeImports = nil,
      },
      MsBuild = {
        LoadProjectsOnDemand = nil,
      },
      RoslynExtensionsOptions = {
        EnableAnalyzersSupport = nil,
        EnableImportCompletion = nil,
        AnalyzeOpenDocumentsOnly = nil,
        EnableDecompilationSupport = nil,
      },
      RenameOptions = {
        RenameInComments = nil,
        RenameOverloads = nil,
        RenameInStrings = nil,
      },
      Sdk = {
        IncludePrereleases = true,
      },
    },
  }
end

vim.lsp.config['omnisharp'] = omnisharplsp()
vim.lsp.enable('omnisharp')

vim.lsp.start({
  name = 'omnisharp',
  cmd = …,
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})

vim.cmd([[
autocmd FileType cs nnoremap <c-]> <cmd>lua require('omnisharp_extended').lsp_definition()<cr>
autocmd FileType cs nnoremap gi <cmd>lua require('omnisharp_extended').lsp_implementation()<cr>
autocmd FileType cs nnoremap gr <cmd>lua require('omnisharp_extended').lsp_references()<cr>
autocmd FileType cs nnoremap gl <cmd>lua vim.diagnostic.open_float()<cr>
autocmd FileType cs set colorcolumn=160
autocmd FileType cs set errorformat=\ %#%f(%l\\\,%c):\ %m
autocmd FileType cs set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly
]])

-- vim.diagnostic.enable = true
-- vim.diagnostic.config({ virtual_lines = true }) enable automatic errors showing inline

-- Personal config
vim.cmd([[
so ~/.vimrc

nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/init.lua<cr>
nnoremap <leader>n mm:bufdo set nu<cr>`m

set fillchars+=vert:\|

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
