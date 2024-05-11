require('helpers/globals')

cmd([[packadd packer.nvim]])
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use 'shaunsingh/nord.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use 'neovim/nvim-lspconfig'
  use 'lervag/vimtex'
end)
