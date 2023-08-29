# archlinux with wayland

## Hyprland

**installation**  

`paru -S hyprland-git`  


## Waybar

**requirements**  

`font`:   

* `JetBrainsMono Nerd Font` (in dotfiles)

**installation**  

`paru -S waybar-hyprland-git`  



## Alacritty

**requirements**  

`font`:  

* `SauceCodePro Nerd Font` (in dotfiles)

**installation**  

`paru -S alacritty-git`  



## Rofi

**requirements**  

`font`:  

* `JetBrainsMono Nerd Font` (in dotfiles)

`icon`:  

* `papirus`
* `hardcode-fixer-git`: To deal with hardcoded application icons
* `hardcode-tray-git`: To fix hardcoded tray icons
* `sif-git`: To fix icons of running Steam games

**installation**  

`paru -S rofi-git papirus-icon-theme-git hardcode-fixer-git hardcode-tray-git sif-git`  


## Joshuto

**requirements**

* `fzf` (optional)
* `wl-clipboard` (optional, for clipboard support)

**installation**

`paru -S joshuto-git fzf-git wl-clipboard-git`



## Dunst

**installation**

`paru -S dunst-git`



## Neovim

**requirements**

* a patched font (in dotfiles)
* `ripgrep`: telescope need
* `nodejs`
* provider: need `pynvim`



**installation**

`paru -S neovim-git ripgrep python-pynvim-git nodejs npm wget unzip`



## Fcitx5

`paru -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-pinyin-moegirl fcitx5-nord`





## Software

**obs**

`paru -S obs-studio xdg-desktop-portal-hyprland`

---



**screenshot**

* `grim` + `slurp`

`paru -S grim-git slurp-git`

---



**pdf**

`paru -S okular`



**communication**

* `linuxqq`
* `telegram`
* `wemeet`

`paru -S linuxqq telegram wemeet-bin`



**office**

`paru -S wps-office-cn ttf-wps-fonts libtiff5`



**game**

* `winegame 游戏助手`





**music**

* `yesplaymusic`
* `listen1`
