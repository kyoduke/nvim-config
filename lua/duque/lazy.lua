local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ 
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
	      	dependencies = { 'nvim-lua/plenary.nvim' }
	},
--- Uncomment the two plugins below if you want to manage the language servers from neovim
-- {'williamboman/mason.nvim'},
-- {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'  },
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup ({
        ensure_installed = { "c", "lua", "javascript", "vim", "vimdoc", "query", "python" },
        auto_install = true,
        highlight = {
          enable = true,
        },
      })
    end,
  }
}
local opts = {}

require("lazy").setup(plugins,opts)
