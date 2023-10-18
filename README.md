## 我的系统环境

[前置系统基本安装](https://github.com/threearapig/install)

### 基本

* hyprland
* waybar
* rofi
* alacritty
* dunst
* swaylock

```bash
paru -S hyprland-git waybar-hyprland-git
paru -S rofi-git
paru -S alacritty-git
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
paru -S neovim-git
paru -S joshuto
paru -S tmux-git
paru -S lazygit-git
paru -S fzf-git
paru -S zsh
```

```bash
chsh -s /usr/bin/zsh
```

```bash
zimfw install
```


**Tmux 需要**  

[安装 Homebrew](https://brew.sh/)

```bash
brew install rainbarf         # 资源监视器
```

**Neovim 需要**  

如果 Neovim 插件有些有问题，`checkhealth` 一下，看看缺少哪些  

```bash
paru -S python-pynvim-git nodejs npm wget unzip yarn ruby ripgrep-git
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
paru -S kvantum                 # qt 设置编辑器
paru -S nwg-look-bin            # gtk 设置编辑器
paru -S adapta-gtk-theme        # adapta 主题
paru -S papirus-icon-theme      # papirus 图标主题
paru -S bibata-cursor-theme     # bibata 光标主题
```


### 常用应用

#### 游戏

安装 `wine`  

```bash
paru -S wine wine-mono wine_gecko wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

[安装 wine 游戏助手](https://winegame.net/downloads/)

将下载后的游戏安装包安装好  
对于阴阳师，将 `Runners` 设置为适用于 `lol` 版本就行，在 `lutris` 中下载就行，版本选新一点的  

> 例如 `lutris-ge-lol`  


**注意：需要对安装好的游戏，单独进行运行环境的指定**  
> Configure -> Runners options -> Wine version


#### 云盘

```bash
brew install aliyunpan      # 阿里云盘CLI
```


#### 其他

```bash
paru -S mpv                                                   # 视频播放器
paru -S okular                                                # PDF 阅读器
paru -S swww-git                                              # 壁纸
paru -S qimgv-git swappy-git                                  # 图片查看/编辑
paru -S wl-clipboard-git                                      # 剪切板
paru -S grim-git slurp-git                                    # 截图
paru -S google-chrome firefox chromium                        # 浏览器
paru -S yesplaymusic listen1-desktop-appimage                 # 音乐
paru -S obs-studio xdg-desktop-portal-hyprland                # 视频录制
paru -S linuxqq telegram-desktop discord wemeet-bin           # 通讯

paru -S htop                      # 系统资源管理
paru -S unzip                     # 解压
paru -S eudic                     # 词典
paru -S neofetch-git              # 系统信息
paru -S network-manager-applet pasystray-wayland blueberry-wayland udiskie                  # 系统托盘软件
paru -S libreoffice-fresh libreoffice-fresh-zh-cn wps-office-cn ttf-wps-fonts libtiff5      # 办公套件
```
