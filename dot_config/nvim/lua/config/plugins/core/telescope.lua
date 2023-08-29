return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
	},
	config = function()
		local actions = require('telescope.actions')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<c-f>', builtin.find_files, {})
		vim.keymap.set('n', '<c-l>', builtin.live_grep, {})
		vim.keymap.set('n', '<c-u>', builtin.buffers, {})
		vim.keymap.set('n', '<c-h>', builtin.oldfiles, {})
		vim.keymap.set('n', '<leader>k', builtin.keymaps, {})
		vim.keymap.set("n", ":", builtin.commands, {})
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
		require('telescope').setup{
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-u>"] = "move_selection_previous",
						["<C-e>"] = "move_selection_next",
						["<C-l>"] = "preview_scrolling_up",
						["<C-y>"] = "preview_scrolling_down",
						["<esc>"] = "close",
					}
				}
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
					}
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				}
			}
		}
		require('telescope').load_extension('fzf')
	end
}
