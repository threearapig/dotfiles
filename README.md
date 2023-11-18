## 我的系统环境

[前置系统基本安装](https://github.com/threearapig/install)

### 基本

* hyprland
* waybar
* alacritty
* rofi
* dunst
* swaylock

```bash
paru -S hyprland-git waybar-git
paru -S alacritty-git
paru -S rofi-git
paru -S dunst-git
paru -S swaylock-effects-git
```

### 核心工具

* neovim
* lazygit
* joshuto
* tmux
* fzf
* zsh

```bash
paru -S neovim
paru -S joshuto
paru -S tmux
paru -S lazygit
paru -S fzf
paru -S zsh
```

```bash
chsh -s /usr/bin/zsh
```


**Tmux 需要**  

[安装 Homebrew](https://brew.sh/)

```bash
brew install rainbarf         # 资源监视器
```

**Neovim 需要**  

如果 Neovim 插件有些有问题，`checkhealth` 一下，看看缺少哪些  

```bash
paru -S python-pynvim nodejs npm wget unzip yarn ruby ripgrep
```

[Neovim 插件使用](https://github.com/threearapig/dotfiles/blob/master/dot_config/nvim/README.md)



### 基本补充

#### 声音

```bash
paru -S alsa-utils alsa-firmware sof-firmware alsa-ucm-conf pulseaudio pulseaudio-alsa
```


#### 蓝牙

```bash
paru -S bluez bluez-utils pulseaudio-bluetooth
```

```bash
sudo systemctl enable --now bluetooth
```


#### 屏幕背光

```bash
paru -S light
```


#### 显卡驱动

amd 核显：  

```bash
paru -S mesa mesa-utils lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
```



#### 字体

`dotfiles` 中包含以下字体：  

* `JetBrainsMono`
* `SourceCodePro`

**Emoji**  

```bash
paru -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
```

**中文**  

```bash
paru -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

**dunst 需要**

```bash
paru -S apple-fonts
```


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
paru -S kvantum                    # qt 设置编辑器
paru -S nwg-look-bin               # gtk 设置编辑器
paru -S adapta-gtk-theme           # adapta 主题
paru -S papirus-icon-theme         # papirus 图标主题
paru -S kora-icon-theme-git        # kora 主题图标（dunst）
paru -S bibata-cursor-theme        # bibata 光标主题
paru -S qt5-wayland qt6-wayland    # qt wayland support
```

### 额外操作

```bash
mkdir ~/Desktop
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Music
mkdir ~/Pictures
mkdir ~/Public
mkdir ~/Templates
mkdir ~/Videos
mkdir ~/GitHub
mkdir ~/Notes
mkdir ~/Videos/OBS
```

### 常用应用


#### wine

```bash
paru -S wine wine-mono wine_gecko wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```


#### 其他

```bash
paru -S swww                                                  # 壁纸
paru -S yesplaymusic                                          # 音乐
paru -S firefox chromium                                      # 浏览器
paru -S linuxqq telegram-desktop discord wemeet-bin           # 通讯
paru -S nautilus                                              # 图形化文件管理器
paru -S typora                                                # markdown
paru -S wechat-uos                                            # 垃圾微信

paru -S network-manager-applet pasystray-wayland blueberry-wayland udiskie          # 系统托盘软件

paru -S libreoffice-fresh libreoffice-fresh-zh-cn wps-office-cn ttf-wps-fonts libtiff5      # 办公套件

paru -S mpv                       # 视频播放器
paru -S htop                      # 系统资源管理
paru -S xmind                     # 思维导图
paru -S unzip                     # 解压
paru -S okular                    # PDF 阅读器
paru -S neofetch                  # 系统信息
paru -S eusoft-eudic-bin          # 词典
paru -S qimgv-git                 # 图片查看
paru -S swappy                    # 图片编辑
paru -S man man-pages             # man 手册
paru -S net-tools                 # 网络工具集

# 屏幕共享 + 录屏
paru -S pipewire wireplumber
paru -S xdg-desktop-portal-hyprland obs-studio

# 截图
## hyprshot 命令行启动截图
## hyprshot-gui-git 图形化启动截图（功能更多）
paru -S grim slurp hyprshot hyprshot-gui-git
# 剪切板 + 剪切板管理
paru -S wl-clipboard wl-clip-persist-git cliphist

# 身份验证代理
paru -S polkit-kde-agent
```

#### 云盘

> 阿里云服务端限制了下载大小，所以好像废了  

```bash
brew install aliyunpan      # 阿里云盘CLI
```

#### 游戏

通过 [winegame游戏助手](https://winegame.net/downloads/) 下载并运行阴阳师  
注意：**安装好阴阳师后，需要在 winegame游戏助手 中将运行阴阳师的wine版本切换成 lol 版本**  
