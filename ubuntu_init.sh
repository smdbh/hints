#!/bin/bash

APP_SOFTWARE="zip unzip curl git wget net-tools"
APT_HOST='https://mirrors.ustc.edu.cn'

# repo settings
version=$(lsb_release -rs)

if [[ $UID -ne 0 ]]; then
  SUDO=sudo
fi


if [[ "$version" > "24.01" ]]; then
    ${SUDO} sed -i "s#https\?://[a-zA-Z0-9.]*#${APT_HOST}#g" /etc/apt/sources.list.d/ubuntu.sources
else
    ${SUDO} sed -i "s#https\?://[a-zA-Z0-9.]*#${APT_HOST}#g" /etc/apt/sources.list
fi




${SUDO} apt update
${SUDO} apt install -y ${APP_SOFTWARE} 

git clone  https://e.coding.net/smdbh/code/myconfig
