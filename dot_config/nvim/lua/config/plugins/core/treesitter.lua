return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"toml",
				"typescript",
				"xml",
			},
			highlight = {
				enable = true,
				disable = {},
			},
			indent = {
				enable = false
			},
		})
	end
}
