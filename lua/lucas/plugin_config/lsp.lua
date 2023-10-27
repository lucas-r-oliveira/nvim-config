local lsp = require("lsp-zero")

--lsp.preset("recommended") 

-- install lsps
lsp.on_attach(function(client, bufnr)
	local opts= { buffer = bufnr, remap = false }

	-- new keybindings below
	-- ...
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		--'sumneko_lua',
		'lua_ls',
		'gopls'
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

-- Autocompletion settings
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select}

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	},
	formatting = lsp.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

lsp.set_preferences({
	sign_icons = {}
})
