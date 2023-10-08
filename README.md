## archlinux + wayland

### 环境

#### 字体

`dotfiles` 包含:  
* `JetBrainsMono`
* `SourceCodePro`

#### 图标

```bash
paru -S papirus-icon-theme-git
```

#### 桌面环境

```bash
paru -S hyprland-git waybar-hyprland-git
```

#### 终端

```bash
paru -S alacritty-git
```

#### 程序启动器

```bash
paru -S rofi-git
```

#### 系统通知器

```bash
paru -S dunst-git
```

#### zsh

```bash
paru -S zsh
```

> 通过 zim 来配置 zsh  



### 核心工具

**安装 [`brew`](https://brew.sh/)**  


**核心四大件**  

```bash
brew install neovim joshuto tmux jesseduffield/lazygit/lazygit
```
* Neovim： 我愿称之为 **编辑器之神**
* Joshuto： 终端文件管理神器，和 `ranger` 一样
* Tmux： 终端复用神器
* Lazygit： Git 客户端，神器

**搭配食用更佳**  

```bash
brew install rainbarf fzf zoxide
```
> rainbarf： 用于 `tmux` 的资源显示  
> fzf： 非常棒的模糊匹配查找，嵌入 `nvim` `joshuto`  
> zoxide： 更好的目录跳转，嵌入 `joshuto`  


**Neovim 需要（有些是插件需要）**

* ripgrep
* checkhealth
    + pynvim
    + nodejs
    + npm
    + wget
    + unzip
    + yarn

```bash
paru -S ripgrep python-pynvim-git nodejs npm wget unzip yarn
```


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


#### wine

```bash
sudo pacman -S wine wine-mono wine_gecko wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

通过命令 `winecfg` 来进行配置  


#### 壁纸

```bash
paru -S swww-git 
```

#### 截图

```bash
paru -S grim-git slurp-git
```


#### 屏幕录制

```bash
paru -S obs-studio xdg-desktop-portal-hyprland
```

#### 系统剪切板（wayland）

```bash
paru -S wl-clipboard-git
```


#### 一些好用的系统托盘

```bash
paru -S network-manager-applet pasystray-wayland blueberry-wayland udiskie
```

#### 浏览器

```bash
paru -S google-chrome firefox chromium
```

#### 音视频播放器

```bash
paru -S mpv
```

#### 音乐播放器

```bash
paru -S yesplaymusic listen1-desktop-appimage
```

#### 图像查看器

```bash
paru -S swappy-git
```


#### 办公套件

```bash
paru -S libreoffice-still libreoffice-still-zh-cn libreoffice-still-en-gb
```

#### PDF 阅读器

```bash
paru -S okular
```

#### 通讯

```bash
paru -S linuxqq telegram-desktop discord wemeet-bin
```

#### 其他

```bash
paru -S neofetch-git
```
