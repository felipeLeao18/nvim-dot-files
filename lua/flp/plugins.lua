local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end
  }
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "wbthomason/packer.nvim" -- Have packer manage itself

use  'leafgarland/typescript-vim'
use  'peitalin/vim-jsx-typescript'

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "arcticicestudio/nord-vim"
  use "windwp/nvim-autopairs"
  use 'sainnhe/everforest'
  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
      {"nvim-telescope/telescope-file-browser.nvim"}, {"kyazdani42/nvim-web-devicons"},
      {"nvim-telescope/telescope-ui-select.nvim"}
    }
  }
  -- cokeline
  use({
    "noib3/nvim-cokeline",
    requires = "kyazdani42/nvim-web-devicons" -- If you want devicons
  })

  -- bdelete
  use "Asheq/close-buffers.vim"
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        commit = "b00b344c0f5a0a458d6e66eb570cfb347ebf4c38"
      }, -- {"nvim-treesitter/nvim-treesitter-textobjects"},
      {"RRethy/nvim-treesitter-textsubjects"}, {"nvim-treesitter/playground", opt = true},
      {"lewis6991/nvim-treesitter-context"}, {"p00f/nvim-ts-rainbow"},
      {"windwp/nvim-ts-autotag"}
    }
  }
  -- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons' -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Colorschemes
  use "lunarvim/colorschemes"

  -- neoscroll
  use 'karb94/neoscroll.nvim'
  use({"glepnir/lspsaga.nvim", branch = "main"})
  -- Nvim cmp
  use {
    "hrsh7th/nvim-cmp",
    as = "cmp",
    requires = {
      {"onsails/lspkind-nvim"}, {"hrsh7th/cmp-nvim-lsp", requires = {"neovim/nvim-lspconfig"}},
      {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}, {"f3fora/cmp-spell"},
      {"hrsh7th/cmp-nvim-lsp-signature-help"}, {"tzachar/cmp-tabnine", run = "./install.sh"},
      {"saadparwaiz1/cmp_luasnip"}
    }
  }

  -- multi-cursors
  use "mg979/vim-visual-multi"
  -- Lazygit
  use 'kdheepak/lazygit.nvim'
  -- comments
  use 'terrortylor/nvim-comment'

  use 'onsails/lspkind.nvim'

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = {"nvim-lua/plenary.nvim"}
  })
  use "folke/zen-mode.nvim"
  use {"akinsho/toggleterm.nvim", tag = '*'}
  use "rafamadriz/friendly-snippets"
  use {"L3MON4D3/LuaSnip"}
  use "morhetz/gruvbox"
  use "tpope/vim-surround"
  use 'alvan/vim-closetag'
  use {
    'akinsho/git-conflict.nvim',
    tag = "*",
    config = function()
      require('git-conflict').setup()
    end
  }
  use "ThePrimeagen/vim-be-good"
  use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest'
  }
}
  use "xiyaowong/nvim-transparent"

  -- Packer
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
