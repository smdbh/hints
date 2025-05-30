#!/bin/bash
PAC_DOMAIN="Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch"

PAC_SOFTWARE=" byobu vim samba zsh htop zip unzip curl fail2ban which 
               git wget tree net-tools openssh locate the_silver_searcher"

# repo settings
echo "$PAC_DOMAIN" | ${SUDO} tee /etc/pacman.d/mirrorlist
${SUDO} pacman-key --init
${SUDO} pacman-key --populate archlinux
${SUDO} pacman -Syu --noconfirm
${SUDO} pacman -Sy --noconfirm  ${PAC_SOFTWARE}



git clone -b arch https://gitlab.com/smdbh-code/home/myconfig