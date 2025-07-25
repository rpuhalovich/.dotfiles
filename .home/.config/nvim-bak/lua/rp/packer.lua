-- From: https://github.com/wbthomason/packer.nvim
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/nvim-cmp'},
            {'neovim/nvim-lspconfig'},
            {'rafamadriz/friendly-snippets'},
            {'saadparwaiz1/cmp_luasnip'},
            {'williamboman/mason-lspconfig.nvim'},
            {'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end}
        }
    })
    use('Hoffs/omnisharp-extended-lsp.nvim')
end)
