return {
	"numToStr/Comment.nvim",
	event = "BufRead",
	config = function()
		require('Comment').setup({
			toggler = {
				line = '<leader>mm',
			},
			opleader = {
				line = '<leader>m',
			},
		})
	end
}
