#!/bin/bash

APP_SOFTWARE=" byobu samba zsh htop zip unzip curl fail2ban 
               git wget tree net-tools openssh-server locate"

# repo settings

sed -i 's#https\?://[a-zA-Z0-9.]*#https://mirrors.ustc.edu.cn/ubuntu#g' /etc/apt/sources.list

${SUDO} apt update
${SUDO} apt install -y ${APP_SOFTWARE} 

git clone  https://e.coding.net/smdbh/code/myconfig
