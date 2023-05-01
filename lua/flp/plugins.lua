local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

return packer.startup(function(use)
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  use "wbthomason/packer.nvim"
  use {
    'nvim-lualine/lualine.nvim',
  }
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "arcticicestudio/nord-vim"
  use "windwp/nvim-autopairs"
  use 'sainnhe/everforest'
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" }, { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-telescope/telescope-media-files.nvim' }
    }
  }
  use({
    "noib3/nvim-cokeline",
    requires = {
      { "kyazdani42/nvim-web-devicons" }
    }


  })

  use "Asheq/close-buffers.vim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      { "RRethy/nvim-treesitter-textsubjects" }, { "nvim-treesitter/playground", opt = true },
      { "lewis6991/nvim-treesitter-context" }, { "p00f/nvim-ts-rainbow" },
      { "windwp/nvim-ts-autotag" }
    }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    tag = 'nightly'
  }

  use "lewis6991/gitsigns.nvim"


  use "lunarvim/colorschemes"

  use("neanias/everforest-nvim")

  use 'karb94/neoscroll.nvim'
  use({ "glepnir/lspsaga.nvim", branch = "main" })

  use {
    "hrsh7th/nvim-cmp",
    as = "cmp",
    requires = {
      { "onsails/lspkind-nvim" },
      { "hrsh7th/cmp-nvim-lsp", requires = { "neovim/nvim-lspconfig" } },
      { "hrsh7th/cmp-buffer" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-path" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "tzachar/cmp-tabnine", run = "./install.sh" },
      { "rcarriga/cmp-dap" }
    }
  }


  use "mg979/vim-visual-multi"

  use 'kdheepak/lazygit.nvim'

  use 'terrortylor/nvim-comment'

  use 'onsails/lspkind.nvim'

  use "folke/zen-mode.nvim"
  use { "akinsho/toggleterm.nvim", tag = '*' }
  use "rafamadriz/friendly-snippets"
  use { "L3MON4D3/LuaSnip" }
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

  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
  use 'lewis6991/impatient.nvim'
  use 'Mofiqul/dracula.nvim'
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use "EdenEast/nightfox.nvim"
  use 'mhartington/oceanic-next'


  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {

      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },


      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },


      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use 'aktersnurra/no-clown-fiesta.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",


    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })



  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
