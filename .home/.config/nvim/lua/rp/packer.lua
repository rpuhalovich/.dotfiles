-- From: https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- use('nvim-treesitter/nvim-treesitter-context')
    use('junegunn/fzf')
    -- use('APZelos/blamer.nvim')
    use('rhysd/git-messenger.vim')
    use('simrat39/symbols-outline.nvim')
    use('junegunn/fzf.vim')
    use('ellisonleao/gruvbox.nvim')
    use('prettier/vim-prettier')
    use('Yggdroot/indentLine')
    use('preservim/nerdtree')
    use('Asheq/close-buffers.vim')
    use({ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end })
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            {'neovim/nvim-lspconfig'},
            { 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end },
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
    }
end)
