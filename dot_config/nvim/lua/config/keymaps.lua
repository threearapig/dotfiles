vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	{ from = "S",             to = ":w<CR>" },
	{ from = "Q",             to = ":q<CR>" },
	{ from = ";",             to = ":",                                                                   mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "`",             to = "~",                                                                   mode = mode_nv },
	{ from = "-",             to = "n" },
	{ from = "=",             to = "N" },

	-- Movement
	{ from = "u",             to = "k",                                                                   mode = mode_nv },
	{ from = "e",             to = "j",                                                                   mode = mode_nv },
	{ from = "n",             to = "h",                                                                   mode = mode_nv },
	{ from = "i",             to = "l",                                                                   mode = mode_nv },
	{ from = "U",             to = "5k",                                                                  mode = mode_nv },
	{ from = "E",             to = "5j",                                                                  mode = mode_nv },
	{ from = "N",             to = "0",                                                                   mode = mode_nv },
	{ from = "I",             to = "$",                                                                   mode = mode_nv },

	-- Actions
	{ from = "l",             to = "u" },
	{ from = "k",             to = "i",                                                                   mode = mode_nv },
	{ from = "K",             to = "I",                                                                   mode = mode_nv },

	-- Window & splits
	{ from = "<leader>w",     to = "<C-w>w", },
	{ from = "<leader>u",     to = "<C-w>k", },
	{ from = "<leader>e",     to = "<C-w>j", },
	{ from = "<leader>n",     to = "<C-w>h", },
	{ from = "<leader>i",     to = "<C-w>l", },
	{ from = "qf",            to = "<C-w>o", },
	{ from = "s",             to = "<nop>", },
	{ from = "su",            to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
	{ from = "se",            to = ":set splitbelow<CR>:split<CR>", },
	{ from = "sn",            to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
	{ from = "si",            to = ":set splitright<CR>:vsplit<CR>", },
	{ from = "<up>",          to = ":res +5<CR>", },
	{ from = "<down>",        to = ":res -5<CR>", },
	{ from = "<left>",        to = ":vertical resize-5<CR>", },
	{ from = "<right>",       to = ":vertical resize+5<CR>", },
	{ from = "srh",           to = "<C-w>b<C-w>K", },
	{ from = "srv",           to = "<C-w>b<C-w>H", },

	-- Tab management
	{ from = "tu",            to = ":tabe<CR>", },
	{ from = "tU",            to = ":tab split<CR>", },
	{ from = "tn",            to = ":-tabnext<CR>", },
	{ from = "ti",            to = ":+tabnext<CR>", },
	{ from = "tmn",           to = ":-tabmove<CR>", },
	{ from = "tmi",           to = ":+tabmove<CR>", },

	-- Other
	{ from = "<leader>sw",    to = ":set wrap<CR>" },
	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
	{ from = "<leader><esc>", to = "<nop>" },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
