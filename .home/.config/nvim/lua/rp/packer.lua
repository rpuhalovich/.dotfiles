-- From: https://github.com/wbthomason/packer.nvim
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    use('ellisonleao/gruvbox.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('wbthomason/packer.nvim')
    use('junegunn/fzf', {run = 'fzf#install()'})
    use('junegunn/fzf.vim')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    })
    use({
        'goolord/alpha-nvim',
        config = function ()
            require('alpha').setup(require('alpha.themes.dashboard').config)
            local dashboard = require('alpha.themes.dashboard')
            dashboard.section.buttons.val = {}
        end
    })
end)
