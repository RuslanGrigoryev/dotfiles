local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'sbdchd/neoformat'
  use {'nvim-lualine/lualine.nvim',
    requires = {{ 'nvim-tree/nvim-web-devicons', opt = true }}
  }
  use 'nvim-tree/nvim-tree.lua'
  use { 
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} } 
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'reasonml-editor/vim-reason-plus'}
  use {
    "kdheepak/lazygit.nvim",
    requires = {{ 'nvim-lua/plenary.nvim'} },
  }
  use {
    'numToStr/Comment.nvim',
    -- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#-usage
    config = function()
        require('Comment').setup()
    end
  }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

