## 我的系统环境

[前置系统基本安装](https://github.com/threearapig/install)

### 基本

* hyprland
* waybar
* alacritty
* rofi
* dunst
* swaylock/hyprlock

```bash
paru -S hyprland waybar alacritty rofi-lbonn-wayland-git dunst hyprlock-git swaylock-effects
```

> 正常版本的rofi在hyprlnad下启动时会失去焦点，rofi-lbonn-wayland-git 这个包可以解决  
> hyprlock 长时间使用会卡死  




### 核心工具

* neovim
* lazygit
* joshuto
* tmux
* fzf
* zsh

```bash
paru -S neovim lazygit joshuto tmux fzf zsh
```

```bash
chsh -s /usr/bin/zsh
```

**joshuto 需要**  

* bat（提供语法高亮）
* ueberzugpp（显示图片）

```bash
paru -S bat ueberzugpp
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
```

### Hyprland 必要软件

```bash
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
paru -S swww                                                              # 壁纸
paru -S nautilus                                                          # 文件
paru -S yesplaymusic                                                      # 音乐
paru -S firefox chromium                                                  # 浏览器

paru -S linuxqq wechat-universal-bwrap telegram-desktop discord wemeet-bin          # 通讯
paru -S network-manager-applet pasystray-wayland blueberry-wayland udiskie          # 系统托盘软件

paru -S mpv                       # 视频播放器
paru -S htop                      # 系统资源管理
paru -S neofetch                  # 系统信息
paru -S net-tools                 # 网络工具集
paru -S unzip unrar               # 解压工具
paru -S man man-pages             # man 手册

paru -S swappy                    # 图片编辑
paru -S qimgv-git                 # 图片查看
paru -S evince okular             # PDF 阅读器
paru -S eusoft-eudic-bin          # 欧路词典
paru -S drawio-desktop-bin        # 画图工具

paru -S typora                    # markdown
paru -S libreoffice-fresh libreoffice-fresh-zh-cn wps-office-cn ttf-wps-fonts libtiff5      # 办公套件
```


#### 云盘

```bash
brew install aliyunpan      # 阿里云盘CLI
```

#### grub 美化

grub 在系统安装部分就已经安装过了，现在这部分只是将 grub 美化一下  

通过 [grub2-themes](grubhttps://github.com/vinceliuice/grub2-themes) 来美化，根据官方安装步骤安装即可  



### 注意事项

如果使用双系统方案：windows + linux  
由于两个系统的默认同步BIOS始终方式不同，导致时间冲突  
> linux 使用 UTC  
> windows 使用 RTC  

解决方法是将 linux 的同步时间方式改为 rtc  

```bash
sudo timedatectl set-local-rtc 1
```
