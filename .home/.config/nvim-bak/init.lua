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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {"Hoffs/omnisharp-extended-lsp.nvim"}
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd([[
so ~/.vimrc

nnoremap <leader>cfg :e<space>~/.dotfiles/.home/.config/nvim/<cr>

set fillchars+=vert:\|

autocmd BufReadPre *.cs set colorcolumn=160

set errorformat=\ %#%f(%l\\\,%c):\ %m
set makeprg=dotnet\ build\ --nologo\ -v\ q\ --property\ WarningLevel=0\ /clp:ErrorsOnly

nnoremap <leader>n mm:bufdo set nu<cr>`m

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

-- LSP --
-- local lsp = require("lsp-zero").preset({
--     name = "minimal",
--     set_lsp_keymaps = true,
--     manage_nvim_cmp = true,
--     suggest_lsp_servers = false
-- })
--
-- lsp.default_keymaps({ buffer = bufnr, omit = {'<cr>'} })
--
-- vim.cmd([[
-- autocmd FileType cs nnoremap <c-]> <cmd>lua require('omnisharp_extended').lsp_definition()<cr>
-- autocmd FileType cs nnoremap gi <cmd>lua require('omnisharp_extended').lsp_implementation()<cr>
-- autocmd FileType cs nnoremap gr <cmd>lua require('omnisharp_extended').lsp_references()<cr>
-- ]])
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     client.server_capabilities.semanticTokensProvider = nil
--   end
-- })
--
-- lsp.setup()

function omnisharplsp()
  ---@brief
  ---
  --- https://github.com/omnisharp/omnisharp-roslyn
  --- OmniSharp server based on Roslyn workspaces
  ---
  --- `omnisharp-roslyn` can be installed by downloading and extracting a release from [here](https://github.com/OmniSharp/omnisharp-roslyn/releases).
  --- OmniSharp can also be built from source by following the instructions [here](https://github.com/omnisharp/omnisharp-roslyn#downloading-omnisharp).
  ---
  --- OmniSharp requires the [dotnet-sdk](https://dotnet.microsoft.com/download) to be installed.
  ---
  --- **By default, omnisharp-roslyn doesn't have a `cmd` set.** This is because nvim-lspconfig does not make assumptions about your path. You must add the following to your init.vim or init.lua to set `cmd` to the absolute path ($HOME and ~ are not expanded) of the unzipped run script or binary.
  ---
  --- For `go_to_definition` to work fully, extended `textDocument/definition` handler is needed, for example see [omnisharp-extended-lsp.nvim](https://github.com/Hoffs/omnisharp-extended-lsp.nvim)
  ---
  ---

  local util = require 'lspconfig.util'

  return {
    cmd = {
      '/Users/ryanpuhalovich/Downloads/omnisharp-lsp/run',
      -- vim.fn.executable('OmniSharp') == 1 and 'OmniSharp' or 'omnisharp',
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
          or util.root_pattern 'function.json'(fname)
      )
    end,
    init_options = {},
    capabilities = {
      workspace = {
        workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
      },
    },
    settings = {
      FormattingOptions = {
        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        EnableEditorConfigSupport = true,
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        OrganizeImports = nil,
      },
      MsBuild = {
        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        LoadProjectsOnDemand = nil,
      },
      RoslynExtensionsOptions = {
        -- Enables support for roslyn analyzers, code fixes and rulesets.
        EnableAnalyzersSupport = nil,
        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        EnableImportCompletion = nil,
        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        AnalyzeOpenDocumentsOnly = nil,
        -- Enables the possibility to see the code in external nuget dependencies
        EnableDecompilationSupport = nil,
      },
      RenameOptions = {
        RenameInComments = nil,
        RenameOverloads = nil,
        RenameInStrings = nil,
      },
      Sdk = {
        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        IncludePrereleases = true,
      },
    },
  }
end

vim.lsp.config['omnisharp'] = omnisharplsp()
vim.lsp.enable('omnisharp')

-- package.path = './omnisharp_extended/lua;' .. package.path
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cs",
--   callback = function(args)
--     vim.keymap.set('n', '<c-]>', function()
--       print('pls go to definition')
--       require('omnisharp_extended').lsp_definition()
--     end)
--   end
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cs",
--   callback = function(args)
--     vim.keymap.set('n', 'gi', function()
--       print('pls go to implementation')
--       require('omnisharp_extended').lsp_implementation()
--     end)
--   end
-- })

-- /Users/ryanpuhalovich/Downloads/omnisharp-lsp/run

vim.cmd([[
autocmd FileType cs nnoremap <c-]> <cmd>lua require('omnisharp_extended').lsp_definition()<cr>
autocmd FileType cs nnoremap gi <cmd>lua require('omnisharp_extended').lsp_implementation()<cr>
autocmd FileType cs nnoremap gr <cmd>lua require('omnisharp_extended').lsp_references()<cr>
]])
