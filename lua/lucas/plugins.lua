local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{ 'nvim-treesitter/playground' },
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, 
	{ 'theprimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	--- Uncomment these if you want to manage LSP servers from neovim
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}
local opts = {}

require('lazy').setup(plugins, opts)
