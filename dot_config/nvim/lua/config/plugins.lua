local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update",  key = "u" },
	{ cmd = "sync",    key = "s" },
	{ cmd = "clean",   key = "cl" },
	{ cmd = "check",   key = "ch" },
	{ cmd = "log",     key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
	{ cmd = "profile", key = "p" },
}
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = "<SPC>" .. v.key
	lazy_cmd[v.cmd].key_plugin = "<leader>" .. v.key
end

require("lazy").setup({
		-- Core
		require("config.plugins.core.treesitter"),
		require("config.plugins.core.telescope"),
		require("config.plugins.core.lsp"),
		require("config.plugins.core.cmp"),
		-- UI
		require("config.plugins.ui.colorscheme"),
		require("config.plugins.ui.statusline"),
		require("config.plugins.ui.tabline"),
		require("config.plugins.ui.indent"),
		require("config.plugins.ui.notify"),
		require("config.plugins.ui.scrollbar"),
		require("config.plugins.ui.window-management"),
		require("config.plugins.ui.modes"),
		-- Tools
		require("config.plugins.tools.undo"),
		require("config.plugins.tools.editor"),
		require("config.plugins.tools.comment"),
		require("config.plugins.tools.git"),
		require("config.plugins.tools.joshuto"),
		require("config.plugins.tools.markdown"),
		require("config.plugins.tools.fcitx"),
})

-- Other
require("plugins.compile_run")
