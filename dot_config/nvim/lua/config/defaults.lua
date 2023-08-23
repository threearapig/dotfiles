vim.b.fileenconding = "utf-8"
vim.o.scrolloff = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = '100'
vim.opt.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.o.list = true
vim.o.listchars = 'tab:|\\ ,trail:▫'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.showmode = false
vim.o.inccommand = 'split'
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.virtualedit = 'block'
vim.o.timeout = false
vim.o.ttimeoutlen = 0
vim.o.updatetime = 100
vim.o.visualbell = true
vim.o.ttyfast = true
vim.o.autochdir = true
vim.o.secure = false
vim.o.exrc = true
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')

-- Restore Cursor Position
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])