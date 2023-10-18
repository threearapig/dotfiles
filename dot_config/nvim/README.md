# Neovim

## 基础部分

### 基础属性

```lua
vim.opt.termguicolors = true            -- 开启终端真彩色
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1  -- 开启终端真彩色
vim.o.cursorline = true                 -- 高亮光标所在的文本行
vim.o.colorcolumn = '100'               -- 通过 hl-ColorColumn 高亮指定列，就是右侧的竖线
vim.o.number = true                     -- 显示行号，作用为：突出相对行号
vim.o.relativenumber = true             -- 显示相对行号
vim.o.signcolumn = "yes"                -- 显示左侧图标指示列
vim.o.list = true                       -- 显示不可见字符
vim.o.listchars = 'tab:|\\ ,trail:▫'    -- 指定用何种符号来显示不可见字符: tab 为制表符、trail 为尾部空格
vim.o.wrap = true                       -- 超过窗口宽度的行会回绕，并在下一行继续显示
vim.o.textwidth = 0                     -- 插入文本的最大宽度，0 为关闭，表示没有限制
vim.o.scrolloff = 4                     -- 光标上下两侧最少保留的屏幕行数
vim.o.showmode = false                  -- 插入、替换和可视模式里，在最后一行提供消息
vim.o.inccommand = 'split'              -- 即时预览命令的效果，split：命令的更改会在preview中显示
vim.o.expandtab = false                 -- 如果设置为假noexpandtab，那么插入模式下按<tab>就是输入\t，用>缩进的结果也是在行前插入\t
vim.o.tabstop = 2                       -- 一个tab等于多少个空格。当在 noexpandtab 的情况下，只会影响 \t 显示多少个空格
vim.o.softtabstop = 2                   -- 按下 <tab> 将补出多少个空格。在 noexpandtab 的状态下，实际补出的是 \t 和空格的组合
vim.o.smarttab = true                   -- 根据文件中其他地方的缩进空格数来确定一个 tab 是多少空格
vim.o.shiftwidth = 2                    -- 使用 >> << 或 == 来缩进代码的时候补出的空格数。这个值也会影响 autoindent 自动缩进的值
vim.o.autoindent = true                 -- 保持先前行的缩进
vim.o.indentexpr = ''                   -- 计算一行所需的缩进距离的表达式，这里为空，表示使用其他缩进计算，比如 smarttab
vim.o.foldmethod = 'indent'             -- 当前窗口使用的折叠方式：相同缩进距离的行构成折叠
vim.o.foldlevel = 99                    -- 设置折叠级别: 高于此级别的折叠会被关闭
vim.o.foldenable = true                 -- 开启折叠功能。如果关闭，所有的折叠都被打开
vim.o.foldlevelstart = 99               -- 在窗口里开始编辑一个缓冲区时没有折叠(99)
vim.o.ignorecase = true                 -- 搜索模式里忽略大小写
vim.o.smartcase = true                  -- 搜索模式里，开启智能大小写，需要与 ignorecase 一起使用
vim.o.splitright = true                 -- 窗口的分割会把新窗口放到当前窗口之右
vim.o.splitbelow = true                 -- 窗口的分割会把新窗口放到当前窗口之下
vim.o.virtualedit = 'block'             -- 允许 可视列块模式（block）的虚拟编辑
vim.o.timeout = false                   -- 关闭 等待键码 或者 映射的键序列 的延迟（与 ttimeoutlen 一起使用）
vim.o.ttimeoutlen = 0                   -- 关闭 等待键码 或者 映射的键序列 的延迟（与 timeout 一起使用）
vim.o.updatetime = 100                  -- 如果过了这么多毫秒数以后还没有任何输入，把交换文件写入磁盘
vim.o.visualbell = true                 -- 使用可视响铃代替鸣叫
vim.o.ttyfast = true                    -- 快速终端连接
vim.o.autochdir = true                  -- 自动切换当前目录为当前文件所在的目录
vim.o.secure = false                    -- 如果打开，当前目录下的 ".vimrc" 和 ".exrc" 不允许使用 ":autocmd"、shell 和 写入命令，映射命令被显示
vim.o.exrc = true                       -- 允许读入当前目录的 .vimrc，.exrc 和 .gvimrc
vim.o.viewoptions = 'cursor,folds,slash,unix'                       -- 视图相关部分的保存和恢复
vim.o.shortmess = vim.o.shortmess .. 'c'                            -- 减少一些提示，c：扫描插入模式补全项目时不给出消息
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'     -- 插入模式下补全的规则
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')            -- 与文本格式化有关，t：根据 textwidth 自动折行，c：在（程序源代码中的）注释中自动折行，插入合适的注释起始字符
```

### 其他有用的设置

打开文件后恢复光标上次所在位置  

```lua
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
```

## 按键映射

这里主要是使用一个表结构，通过 `for` 循环来依次加载按键映射  

---

表结构：  
```lua
local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    from = "new",           to = "old",         mode = mode_x
}
```

结构说明：  
* from：映射按键
* to：被映射按键
* mode：在什么模式下映射
    * `n`: normal
    * `v`: visual
    * `i`: insert

---

`for` 循环：  
```lua
for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
```

`mapping.mode or "n"` 表示结构中没有指名模式，统一按照 "n" 来映射  



## 插件

插件管理器使用 `lazy.nvim`  

### 核心部分

* [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [telescope](https://github.com/nvim-telescope/telescope.nvim)
    + [plenary](https://github.com/nvim-lua/plenary.nvim)
    + [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
    + 依赖 `ripgrep` 和 `fzf` 程序
* [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
    + [mason](https://github.com/williamboman/mason.nvim)
    + [lspconfig](https://github.com/neovim/nvim-lspconfig)
    + [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
    + [neodev.nvim](https://github.com/folke/neodev.nvim)
    + [fidget.nvim](https://github.com/j-hui/fidget.nvim)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    + [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
    + [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
    + [cmp-path](https://github.com/hrsh7th/cmp-path)
    + [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
    + [cmp-nvim-ultisnips](https://github.com/quangnguyen30192/cmp-nvim-ultisnips)
        + [ultisnips](https://github.com/SirVer/ultisnips)
        + [vim-snippets](https://github.com/honza/vim-snippets)
    + [cmp-calc](https://github.com/hrsh7th/cmp-calc)
    + [lspkind](https://github.com/onsails/lspkind.nvim)


### 工具部分

* [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
    + [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
        + 需要字体为 [patched font](https://www.nerdfonts.com/)
* [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
* [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
* [undotree](https://github.com/mbbill/undotree)
* [dropbar](https://github.com/Bekaboo/dropbar.nvim)

**编辑**  

* [vim-illuminate](https://github.com/RRethy/vim-illuminate)
* [bullets](https://github.com/dkarter/bullets.vim)
* [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
* [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* [Comment.nvim](https://github.com/numToStr/Comment.nvim)
* [joshuto.nvim](https://github.com/theniceboy/joshuto.nvim)

### UI 部分

* [nvim-deus](https://github.com/theniceboy/nvim-deus)
* [hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim)
* [nvim-notify](https://github.com/rcarriga/nvim-notify)
* [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
    + [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
* [lualine](https://github.com/nvim-lualine/lualine.nvim)
* [bufferline](https://github.com/akinsho/bufferline.nvim)
    + [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
        + 需要字体为 [patched font](https://www.nerdfonts.com/)
* [colorful-winsep](https://github.com/nvim-zh/colorful-winsep.nvim)
