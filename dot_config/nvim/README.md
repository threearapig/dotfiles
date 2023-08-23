# Neovim 配置过程

## Basic

### Basic Attributes

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

### Other useful settings

打开文件后恢复光标上次所在位置  

```lua
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
```

## Keymaps

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



## Plugins

插件管理器使用 `lazy.nvim`  

首先需要安装 `lazy.nvim`  


主要需要的功能：  
* UI
* Treesitter
* Telescope
* LSP
* cmp



### UI

#### colorcolumn

Plugin: `folke/tokyonight.nvim`  


#### statusline

Plugin: `nvim-lualine/lualine.nvim`  

官方的默认配置就可以了  
只需要根据需求改一些 `sections`，就是底部状态栏显示哪些  


#### tabline

Plugin: `akinsho/bufferline.nvim`  

需要 `nerd-font` 来显示一些字体图标  
还需要一个 `colorscheme`  

---

在 `setup.options` 中需要指定:  

`mode = tabs`: 表示只用于显示 `tabpages`（如果设置为默认的 `buffer`，会有一些奇奇怪怪的操作，不习惯）  

---

`diagnostics = "nvim_lsp"`: 表示语法警告通过 `nvim_lsp` 来获取  

---

```lua
diagnostics_indicator = function(count, level, diagnostics_dict, context)
    local icon = level:match("error") and " " or " "
    return " " .. icon .. count
end,
```

指定当有警告时，什么样的警告通过什么样的图标在 `tabpages` 上显示出来  

---

```lua
indicator = {
    icon = '▎',
    style = 'icon',
},
```

当前窗口用什么图标来突出显示  

---

```lua
show_buffer_close_icons = false,    -- tab 的关闭图标
show_close_icon = false,            -- 整个窗口的关闭图标
enforce_regular_tabs = true,        -- 强制指定不同的 tab 功能
show_duplicate_prefix = false,      -- 不显示重复的前缀
tab_size = 16,                      -- tab 的大小
padding = 0,                        -- tab 间的间隔
separator_style = "thick",          -- tab 的样式
```

### treesitter

Plugin: `nvim-treesitter/nvim-treesitter`  

主要用于语法高亮  

现在用到的主要有 `language parsers` 和 `modules`  

---

```lua
ensure_installed = { "c", "cpp", "lua", "vim", "bash", "python", "markdown", "markdown_inline", "vimdoc", "query" },
```

用于指定需要安装的 `language parsers`  

---

```lua
highlight = {
    enable = true,
    disable = {},
},
```

用于指定 `highlight module` 的一些设置  

---

```lua
indent = {
    enable = false
},
```

用于指定 `indent module` 的一些设置  


### telescope

Plugin: `nvim-telescope/telescope.nvim`  

非常好用的模糊匹配搜索插件  

需要一些依赖：
* `nvim-lua/plenary.nvim`

---

需要安装一些软件来支持更好的搜索  

`ripgrep`: telescope 的 `File Pickers` 的 `live_grep` 和 `grep_string` 需要这个软件  


```bash
sudo pacman -S ripgrep
```

---

为了是 telescope 进行模糊匹配的时候，可以更好的进行分拣、分类（也就是更好的进行模糊搜索）  
需要借助外部软件来实现，这里通过 `FZF` 这个软件来提供更好的模糊搜索匹配  
通过另一个插件 `nvim-telescope/telescope-fzf-native.nvim` 来与 `FZF` 进行通信  

```bash
sudo pacman -S FZF
```


除了安装插件和对应的软件之外，还需要引入这个插件  

通过 `setup.extensions` 来指定插件的配置信息  
并且通过 `require('telescope').load_extension('fzf')` 来加载指定插件  

---

不同模糊搜索框属于不同的 `Pickers`  
`telescope` 提供了一些内置的 `Pickers`  

```lua
require("telescope.builtin").need_picker
```

通过上面的来调用需要的不同的 `Pickers`  

通过 `setup.pickers` 来指定各个 `picker` 的配置信息  

---

通过 `setup.defaults.mappings.i` 来指定一些按键的映射  



### lsp

主要通过三个插件来完成 `lsp` 的一些功能  

Plugins:  
* lspconfig
* mason
* mason-lspconfig


---

lspconfig: `neovim/nvim-lspconfig`  

Neovim 本身支持了 lsp 的功能，但是需要根据不同的语言进行不同的配置  
`nvim-lspconfig` 插件提供了一系列语言的配置  

---

mason: `williamboman/mason.nvim`  

Neovim 虽然支持了 lsp，但是 Neovim 只是一个客户端，最重要的是要有一系列 `Language Servers` 来提供后台处理  

但是不同的 `Language Servers` 需要根据不同的操作系统来分别安装，一个一个安装很繁琐  
所以 `mason` 提供了自动安装不同 `Language Servers` 的功能，只需要在指定的配置项写入需要安装的 `Language Servers` 即可  

---

mason-lspconfig: `williamboman/mason-lspconfig.nvim`  

上面的两个插件解决了不同语言 lsp 的配置信息 和 自动安装 `Language Servers` 的功能  
而 `mason-lspconfig` 将上面两个插件的功能连接在一起，主要功能为：  
* 根据 `mason-lspconfig` 的配置自动调用 `mason` 来安装各个 `Language Servers`  
* 根据 `mason-lspconfig` 的配置，根据文件的类型，自动加载特定的 `lspconfig`，从而启动指定的 `Language Servers`  

---

自动安装 `Language Servers`:  

```lua
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "bashls", "clangd", "marksman", "pyright" },
    automatic_installation = true,
})
```

这段内容指定了需要自动安装的 `Language Servers`，并且指定自动安装  

---

自动加载 `lspconfig`:  

```lua
require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
        })
    end,
}
```

这段内容根据文件的类型，自动加载特定的 `lspconfig`  

---

其他关于按键映射部分，看配置文件即可  


### cmp

Plugin: `hrsh7th/nvim-cmp`  

`nvim-cmp` 提供了一个自动补全引擎  
但是这不意味着 `nvim-cmp` 就支持各种功能的补全  

各种补全的功能是通过 `sources` 来提供的  
这些 `sources` 需要单独成为一个插件供安装，并通过 `setup.sources` 来指定需要的 `sources`  

```lua
require("cmp").setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }
```

上面的就是一个例子，指定补全的 `sources`  

但是光指定还没有用，需要安装指定 `sources` 的插件  

```lua
"hrsh7th/cmp-nvim-lsp",
"hrsh7th/cmp-buffer",
"hrsh7th/cmp-path",
```

这也是一些 `sources` 插件的例子  

---

对于补全的相关功能按键  

```lua
require("cmp").setup {
    mapping = {
    }
}
```

通过 `mapping` 来指出  
