-- From: https://github.com/wbthomason/packer.nvim
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
    use('ellisonleao/gruvbox.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('preservim/nerdtree')
    use('sbdchd/neoformat')
    use('simrat39/symbols-outline.nvim')
    use('tpope/vim-fugitive')
    use('wbthomason/packer.nvim')
    use({'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = {{'nvim-lua/plenary.nvim'}}})
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
            dashboard.section.buttons.val = {
                dashboard.button('<leader>e', 'File Explorer'),
                dashboard.button('<leader>f', 'Find File'),
                dashboard.button('?', 'Find Word'),
                dashboard.button('e', 'New Scratch Buffer', ':enew<cr>'),
                dashboard.button('q', 'Quit', ':qa<cr>')
            }
        end
    })
end)
