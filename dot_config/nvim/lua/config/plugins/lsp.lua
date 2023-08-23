return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
		},
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
		},
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		-- nvim-lspconfig

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', '<leader>da', require("telescope.builtin").diagnostics, opts)
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', require("telescope.builtin").lsp_definitions, opts)
				vim.keymap.set('n', '<leader>h', "<cmd>Lspsaga hover_doc<cr>", opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<cr>", opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', "<cmd>Lspsaga code_action<cr>", opts)
				vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, opts)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})

		-- lspsaga
		require("lspsaga").setup()

		-- neodev
		require("neodev").setup()

		-- fidget
		require("fidget").setup()

		-- mason
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		-- mason-lspconfig
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "bashls", "clangd", "marksman", "pyright" },
			automatic_installation = true,
		})
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require("mason-lspconfig").setup_handlers {
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
		}
	end
}
