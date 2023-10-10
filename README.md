## archlinux + wayland

### 桌面环境

```bash
paru -S hyprland-git waybar-hyprland-git  # 窗口管理和状态栏
paru -S rofi-git                          # 程序启动器
paru -S alacritty-git                     # 终端
paru -S dunst-git                         # 系统通知器
paru -S papirus-icon-theme-git            # 图标
```


`dotfiles` 中包含以下字体：  

* `JetBrainsMono`
* `SourceCodePro`

---


### 核心工具


**核心大件**  

```bash
paru -S neovim-git joshuto tmux-git lazygit-git zsh
```
* Neovim： 我愿称之为 **编辑器之神**
* Joshuto： 终端文件管理神器，和 `ranger` 一样
* Tmux： 终端复用神器
* Lazygit： Git 客户端，神器
* zsh：常用的 shell

```bash
chsh -l # 查看可更换的 shell
chsh -s /usr/bin/zsh # 更换 shell 为 zsh
```

```bash
zimfw install # 安装 zim 模块
```


**搭配食用更佳**  

```bash
brew install rainbarf
```

```bash
paru -S fzf-git zoxide-git ripgrep-git
```

* fzf： 嵌入 `nvim` `joshuto`，非常棒的模糊匹配查找
* ripgrep：`nvim` 插件 `telescope` 需要
* rainbarf：`tmux` 的资源显示
* zoxide：嵌入 `joshuto`，更好的目录跳转


**Neovim 依赖**

如果 Neovim 插件有些有问题，`checkhealth` 一下，看看缺少哪些  

```bash
paru -S python-pynvim-git nodejs npm wget unzip yarn ruby
```

[Neovim 插件使用](https://github.com/threearapig/dotfiles/blob/master/dot_config/nvim/README.md)


---


### 常用软件


#### 输入法

```bash
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-nord
```

编辑文件：`/etc/environment`  
添加以下内容：  

```environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus
```


#### 游戏

[Wine游戏助手](https://winegame.net/downloads/)  


#### 其他

```bash
brew install aliyunpan # 阿里云盘CLI
```

```bash
paru -S swww-git # 壁纸
paru -S grim-git slurp-git # 截图
paru -S google-chrome firefox chromium # 浏览器
paru -S yesplaymusic listen1-desktop-appimage # 音乐
paru -S linuxqq telegram-desktop discord wemeet-bin # 通讯
paru -S mpv # 视频播放器
paru -S okular # PDF 阅读器
paru -S swappy-git # 图片查看器
paru -S obs-studio xdg-desktop-portal-hyprland # 视频录制
paru -S libreoffice-still libreoffice-still-zh-cn libreoffice-still-en-gb # 办公套件
paru -S network-manager-applet pasystray-wayland blueberry-wayland udiskie # 系统托盘软件
paru -S neofetch-git # 系统信息
paru -S unzip # 解压
paru -S wl-clipboard-git # 剪切板
paru -S eudic # 词典
```
