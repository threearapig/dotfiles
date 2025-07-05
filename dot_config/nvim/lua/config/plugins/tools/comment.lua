return {
	"numToStr/Comment.nvim",
	event = "BufRead",
	config = function()

		local ft = require('Comment.ft')

		ft({'c', 'cpp', 'go', 'rust', 'javascript'}, {'//%s', '/*%s*/'})

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
