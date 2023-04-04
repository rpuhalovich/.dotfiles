-- From: https://github.com/wbthomason/packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } })
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ellisonleao/gruvbox.nvim')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('Yggdroot/indentLine')
    use('Asheq/close-buffers.vim')
    use({ 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end })
    use({ 'neoclide/coc.nvim', branch = 'release' })
end)
