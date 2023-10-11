## archlinux + wayland

### 桌面环境

```bash
paru -S hyprland-git waybar-hyprland-git  # 窗口管理和状态栏
paru -S rofi-git                          # 程序启动器
paru -S alacritty-git                     # 终端
paru -S dunst-git                         # 系统通知器
paru -S papirus-icon-theme                # 图标
paru -S bibata-cursor-theme               # 鼠标
```


`dotfiles` 中包含以下字体：  

* `JetBrainsMono`
* `SourceCodePro`

---


### 核心工具


**核心大件**  

```bash
paru -S neovim-git joshuto tmux-git lazygit-git fzf-git zsh
```

```bash
chsh -l # 查看可更换的 shell
chsh -s /usr/bin/zsh # 更换 shell 为 zsh
```

```bash
zimfw install # 安装 zim 模块
```


**搭配食用更佳**  

[安装 Homebrew](https://brew.sh/)

```bash
brew install rainbarf
```

**Neovim 依赖**

如果 Neovim 插件有些有问题，`checkhealth` 一下，看看缺少哪些  

```bash
paru -S python-pynvim-git nodejs npm wget unzip yarn ruby ripgrep-git
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

#### 主题


```bash
paru -S nwg-look-bin kvantum adapta-gtk-theme
```

> GTK 和 QT 都使用主题：`adapta`  
> nwg-look-bin：用于设置 GTK  
> kvantum：用于设置 QT  


#### 声音管理

```bash
sudo pacman -S alsa-utils alsa-firmware sof-firmware alsa-ucm-conf pulseaudio pulseaudio-alsa
```

> amixer 和 alsamixer 工具都包含在alsa-utils包里  
> amixer 和 alsamixer：管理声音，一个命令，一个命令行图形界面管理  
> alsa-firmware、sof-firmware 和 alsa-ucm-conf：某些声卡可能需要的固件  

#### 蓝牙

```bash
paru -S bluez bluez-utils pulseaudio-bluetooth
```

> bluez：提供蓝牙协议栈  
> bluez-utils：提供 bluetoothctl 实用程序  
> pulseaudio_bluebooth：用于蓝牙的声音  

```bash
sudo systemctl enable bluetooth.service
```

#### 屏幕背光管理

```bash
paru -S light
```

> light：管理屏幕亮度  


#### 显卡驱动

amd 核显：  

```bash
sudo pacman -S mesa mesa-utils lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
```


#### 字体

**Emoji**  

```bash
paru -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```

**中文**  

```bash
paru -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```


#### 游戏

```bash
paru -S lutris-git
```

将下载后的游戏安装包安装好  
对于阴阳师，将 `Runners` 设置为 `lutris` 普通版本就行，在 `lutris` 中下载就行，版本选新一点的    


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
paru -S htop         # 系统资源管理
paru -S unzip # 解压
paru -S wl-clipboard-git # 剪切板
paru -S eudic # 词典
```
