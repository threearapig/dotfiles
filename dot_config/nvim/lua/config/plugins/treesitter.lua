return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require'nvim-treesitter.configs'.setup({
			ensure_installed = { "c", "cpp", "lua", "vim", "bash", "python", "markdown", "markdown_inline", "vimdoc", "query" },
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
