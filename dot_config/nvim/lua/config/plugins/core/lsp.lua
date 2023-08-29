return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
		},
		"williamboman/mason-lspconfig.nvim",
		"nvimdev/lspsaga.nvim",
		"folke/neodev.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			event = "LspAttach",
		},
	},
	config = function()

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(event)
				local opts = { buffer = event.buf, noremap = true, nowait = true }
				vim.keymap.set('n', '<leader>h', '<cmd>Lspsaga hover_doc<CR>', opts)
				vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename ++project<CR>', opts)
				vim.keymap.set('n', '<leader>aw', '<cmd>Lspsaga code_action<CR>', opts)
				vim.keymap.set('n', 'gd', require "telescope.builtin".lsp_definitions, opts)
				vim.keymap.set('n', 'gi', require "telescope.builtin".lsp_implementations, opts)
				vim.keymap.set('n', 'gf', require "telescope.builtin".lsp_references, opts)
				vim.keymap.set('n', 'go', require "telescope.builtin".lsp_type_definitions, opts)
				vim.keymap.set('n', '<leader>da', require "telescope.builtin".diagnostics, opts)
			end,
		})

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
			jsonls = {},
			bashls = {},
			taplo = {},
			clangd = {},
			pyright = {},
			marksman = {},
			dockerls = {},
			docker_compose_language_service = {},
			html = {},
			cssls = {},
		}

		require('lspsaga').setup({
			lightbulb = {
				enable = false,
			},
			rename = {
				keys = {
					quit = "<ESC>",
				},
			},
			code_action = {
				keys = {
					quit = "<ESC>",
				},
			},
		})
		require("fidget").setup()
		require("neodev").setup()
		require("mason").setup()

		require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
		})

		for server, config in pairs(servers) do
				require("lspconfig")[server].setup(
					vim.tbl_deep_extend("keep",
						{
							capabilities = require('cmp_nvim_lsp').default_capabilities()
						},
						config
					)
				)
		end
	end
}
