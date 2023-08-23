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
		require("config.plugins.colorscheme"),
		require("config.plugins.statusline"),
		require("config.plugins.tabline"),
		require("config.plugins.treesitter"),
		require("config.plugins.telescope"),
		require("config.plugins.lsp"),
		require("config.plugins.cmp"),
		require("config.plugins.indent"),
		require("config.plugins.editor"),
		require("config.plugins.git"),
		require("config.plugins.notify"),
		require("config.plugins.undo"),
		require("config.plugins.window-management"),
		require("config.plugins.scrollbar"),
		require("config.plugins.markdown"),
		require("config.plugins.winbar"),
		require("config.plugins.joshuto"),
})

require("plugins.fcitx5")
require("plugins.compile_run")
