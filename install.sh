#!/bin/bash


sudo dnf upgrade


# Spotify -----------------------------------------------------------------------------

# Adicionando o repositório
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo

# Importando a key
sudo rpm --import http://negativo17.org/repos/RPM-GPG-KEY-slaanesh

# Instalando o spotify
sudo dnf install spotify-client

echo "Instalacao concluida do spotify"


# Skype -----------------------------------------------------------------------------

# Adicionando o repositório 
sudo dnf config-manager --add-repo https://repo.skype.com/data/skype-stable.repo

# Importando a key
sudo rpm --import https://repo.skype.com/data/SKYPE-GPG-KEY

# Instalando o skype
sudo dnf install skypeforlinux

echo "Instalacao concluida do skype"


# qBittorrent -----------------------------------------------------------------------------

sudo dnf install qbittorrent

echo "Instalacao concluida do qbittorrent"


# Google Chrome -----------------------------------------------------------------------------

# Adicionadno a chave
sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Adicionando o repositório
sudo tee /etc/yum.repos.d/google-chrome.repo <<RPMREPO
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
RPMREPO

# Instalando 
sudo dnf install google-chrome-stable

echo "Instalacao concluida do google chrome"


# Mozilla Firefox -----------------------------------------------------------------------------

# Baixando
wget -O firefox-stable-64.tar.bz2 -c "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=pt-BR"

# Extraindo
tar -vxjf firefox-*.tar.bz2 && mv firefox firefox-stable

# Movendo
sudo mv firefox-stable /opt

# Criando link simbólico
sudo ln -s /opt/firefox-stable/firefox-bin /usr/bin/firefox-stable && sudo ln -s /opt/firefox-stable/browser/icons/mozicon128.png /usr/share/pixmaps/firefox-stable.png

# Atalho
sudo tee /usr/share/applications/firefox-stable.desktop <<ATALHO
[Desktop Entry]
Version=1.0
Name=Firefox
GenericName=Navegador Web
Comment=Navegue na Internet
Exec=firefox-stable %u
Icon=/opt/firefox-stable/browser/icons/mozicon128.png
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=Nova janela
Exec=firefox-stable %u

[Desktop Action new-private-window]
Name=Nova janela privativa
Exec=firefox-stable --private-window %u
ATALHO


# Adobe Flash -----------------------------------------------------------------------------

# 64Bits
sudo dnf install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
# sudo dnf install http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm

# Importando a chave
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# Instalando 
sudo dnf install flash-plugin

echo "Instalacao concluida do adobe flash"


# Zsh ----------------------------------------------------------------------------

sudo dnf install zsh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Theme PowerLevel9K
sudo dnf install powerline powerline-fonts
# https://github.com/bhilburn/powerlevel9k


