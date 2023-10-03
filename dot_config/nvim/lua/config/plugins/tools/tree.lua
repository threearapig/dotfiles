return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			--
			-- Navigate
			--
			vim.keymap.set('n', 'I',         api.node.open.edit,                    opts('Open'))
			vim.keymap.set('n', 'N',         api.node.navigate.parent_close,        opts('Close Directory'))
			vim.keymap.set('n', '<C-i>',     api.tree.change_root_to_node,          opts('CD'))
			vim.keymap.set('n', '<C-n>',     api.tree.change_root_to_parent,        opts('Up'))
			vim.keymap.set('n', 'zh',        api.tree.toggle_hidden_filter,         opts('Close'))
			vim.keymap.set('n', 'q',         api.tree.close,                        opts('Close'))
			vim.keymap.set('n', '?',         api.tree.toggle_help,                  opts('Help'))

			--
			-- filesystem
			--
			vim.keymap.set('n', 'A',         api.fs.create,                         opts('Add file or directory'))
			vim.keymap.set('n', 'dd',        api.fs.cut,                            opts('Cut'))
			vim.keymap.set('n', 'dD',        api.fs.remove,                         opts('Delete'))
			vim.keymap.set('n', 'pp',        api.fs.paste,                          opts('Paste'))

			-- copy
			vim.keymap.set('n', 'yy',        api.fs.copy.node,                      opts('Copy Node'))
			vim.keymap.set('n', 'yn',        api.fs.copy.filename,                  opts('Copy Filename'))
			vim.keymap.set('n', 'yp',        api.fs.copy.absolute_path,             opts('Copy Filepath: Absolute'))
			vim.keymap.set('n', 'yd',        api.fs.copy.relative_path,             opts('Copy Filename: Relative'))

			-- rename
			vim.keymap.set('n', 'a',         api.fs.rename_basename,                opts('Rename: append_basename'))
			vim.keymap.set('n', 'cn',        api.fs.rename_sub,                     opts('Rename: empty_all'))
			vim.keymap.set('n', 'cl',        api.fs.rename,                         opts('Rename: keep_all'))
		end

		require("nvim-tree").setup {
			on_attach = my_on_attach,
			hijack_cursor = false,
			auto_reload_on_write = true,
			disable_netrw = true,
			sort = {
				sorter = "case_sensitive",
				folders_first = true,
			},
			view = {
				centralize_selection = true,
				cursorline = true,
				side = "left",
				signcolumn = "yes",
				width = 23,
			},
			filters = {
				dotfiles = true,
			},
		}
	end,
}
