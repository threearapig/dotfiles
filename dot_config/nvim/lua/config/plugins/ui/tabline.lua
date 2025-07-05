return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				indicator = {
					icon = '▎',
					style = 'icon',
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
				enforce_regular_tabs = true,
				show_duplicate_prefix = false,
				tab_size = 16,
				padding = 0,
				separator_style = "thick",
			},
		})
	end
}
