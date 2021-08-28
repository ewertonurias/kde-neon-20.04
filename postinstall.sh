#!/bin/bash

### Habilita suporte multi-arquitetura
printf "\nEtapa 1/11: Habilitando arquitetura i386... \n"
sudo dpkg --add-architecture i386

### Atualiza repositórios e pacotes
printf "\nEtapa 2/11: Atualizando o sistema... \n\n"
sudo apt update && sudo apt full-upgrade

### Função para KDE Plasma
kde(){
    printf "\nEtapa 3/11: Instalando aplicativos KDE... \n\n"
    sudo apt install k{ate,df,denlive,rita,colorchooser,get,deconnect,systemlog,calc} akregator qbittorrent ffmpegthumbs sweeper partitionmanager
    printf "\nEtapa 4/11: Instalando aplicativos GTK... \n\n"
    sudo apt install vlc l{ibreoffice,ibreoffice-l10n-pt-br,ibreoffice-qt5,ibreoffice-kde5} i{nkscape,nxi} synaptic neofetch obs-studio jstest-gtk
}

### Função para Gnome-Shell
gnome(){
    printf "\nEtapa 3/11: Instalando aplicativos GTK... \n\n"
    sudo apt install vlc l{ibreoffice,ibreoffice-l10n-pt-br} g{imp,parted,nome-disk-utility} i{nkscape,nxi} synaptic neofetch obs-studio jstest-gtk
    printf "\nEtapa 4/11: Instalando aplicativos KDE... \n\n"
    sudo apt install kdenlive qbittorrent
}

### Detecção automática de ambiente desktop
case $XDG_CURRENT_DESKTOP in
    "KDE") kde;;
    "GNOME") gnome;;
esac

### Driver proprietário NVIDIA
printf "\nEtapa 5/11: Instalando driver proprietário NVIDIA... \n\n"
sudo apt install nvidia-driver-460

### Instala o Steam
printf "\nEtapa 6/11: Instalando o Steam... \n\n"
sudo apt install steam

### Adiciona o repositório openSUSE Emulators para instalar o Wine-Staging
printf "\nEtapa 7/11: Instalando Wine-Staging... \n\n"
sudo printf "deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04 ./" | sudo tee /etc/apt/sources.list.d/wine-obs.list
wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04/Release.key | sudo apt-key add -
sudo apt update && sudo apt install winehq-staging

### Adiciona o repositório Lutris
printf "\nEtapa 8/11: Instalando o Lutris... \n\n"
sudo add-apt-repository ppa:lutris-team/lutris && sudo apt install lutris

### Baixa e instala o pacote Discord
printf "\nEtapa 9/11: Instalando o Discord... \n\n"
wget -cO discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb

### Instala o Flatpak e adiciona o repositório Flathub
printf "\nEtapa 10/11: Adicionando Repositório Flathub... \n\n"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

### Instala o Telegram-Desktop (Flatpak)
printf "\nEtapa 11/11: Instalando o Telegram... \n\n"
flatpak install flathub org.telegram.desktop

### Fim do script.
printf "\nFIM DO SCRIPT \n\n"
