# archlinux with wayland

## Hyprland

### requirements

* swww
* waybar
* fcitx5
* dunst
* nm-applet
* pasystray
* udiskie

> waybar, fcitx5 and dunst are installed separately

```bash
paru -S swww-git network-manager-applet pasystray-wayland udiskie
```

### installation

```bash
paru -S hyprland-git
```


## Waybar

### requirements

* JetBrainsMono Nerd Font
* swww
* rofi

> JetBrainsMono Nerd Font included in dotfiles  
> swww is already installed in hyprland  
> rofi is installed separately  

### installation

```bash
paru -S waybar-hyprland-git
```

## Alacritty

### requirements

* SauceCodePro Nerd font

> SauceCodePro Nerd Font included in dotfiles  

### installation

```bash
paru -S alacritty-git
```


## Rofi

### requirements

* `JetBrainsMono Nerd Font`
* `papirus`: icon theme
* `hardcode-fixer-git`: To deal with hardcoded application icons
* `hardcode-tray-git`: To fix hardcoded tray icons
* `sif-git`: To fix icons of running Steam games

> JetBrainsMono Nerd Font included in dotfiles  

### installation

```bash
paru -S rofi-git papirus-icon-theme-git hardcode-fixer-git hardcode-tray-git sif-git
```


## Joshuto

### requirements

* fzf
* wl-clipboard
* mpv
* mediainfo
* qimgv
* swappy
* libreoffice

```bash
paru -S mpv-git mediainfo-git qimgv-git swappy-git libreoffice-still libreoffice-still-zh-cn libreoffice-still-en-gb fzf-git wl-clipboard-git
```

### installation

```bash
paru -S joshuto 
```

> `joshuto-git` has some problems  



## Dunst

### installation

```bash
paru -S dunst-git
```


## Neovim

### requirements

* a patched font
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


**installation**

```bash
paru -S neovim-git
```


## Fcitx5

```bash
paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-nord
```




## Software

### wine

```bash
sudo pacman -S wine wine-mono wine_gecko wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```


### OBS

```bash
paru -S obs-studio xdg-desktop-portal-hyprland
```



### Screenshot

* `grim` + `slurp`

```bash
paru -S grim-git slurp-git
```


### Reader

```bash
paru -S okular
```


### Communication

* `linuxqq`
* `telegram`
* `wemeet`

```bash
paru -S linuxqq telegram-desktop wemeet-bin discord
```


### Office

```bash
paru -S libreoffice-still libreoffice-still-zh-cn libreoffice-still-en-gb
paru -S wps-office-cn ttf-wps-fonts libtiff5
```



### Game

* `winegame 游戏助手`

winegame 游戏助手前往官网安装  



### Music

* `yesplaymusic`

```bash
paru -S yesplaymusic
```
