#!/bin/bash

#if [ $UID -ne 0 ]; then
#    printf "NÃO É ROOT \n"
#    exit 255
#fi

printf "\nEtapa 1/12: Adicionando suporte i386... \n"
sudo dpkg --add-architecture i386

printf "\nEtapa 2/12: Atualizando o sistema... \n\n"
sudo apt update && sudo apt full-upgrade

kde(){
    printf "\nEtapa 3/12: Instalando aplicativos KDE... \n\n"
    sudo apt install kate kdf kdenlive krita kcolorchooser akregator kget qbittorrent kdeconnect ffmpegthumbs ksystemlog kcalc sweeper partitionmanager
    printf "\nEtapa 4/12: Instalando aplicativos GTK... \n\n"
    sudo apt install vlc libreoffice libreoffice-l10n-pt-br libreoffice-qt5 libreoffice-kde5 inkscape synaptic neofetch inxi jstest-gtk obs-studio jstest-gtk
}

gnome(){
    printf "\nEtapa 3/12: Instalando aplicativos GTK... \n\n"
    sudo apt install vlc libreoffice libreoffice-l10n-pt-br libreoffice-qt5 libreoffice-kde5 gimp inkscape synaptic gparted gnome-disk-utility neofetch inxi jstest-gtk obs-studio jstest-gtk
    printf "\nEtapa 4/12: Instalando aplicativos KDE... \n\n"
    sudo apt install kdenlive qbittorrent
}

case $XDG_CURRENT_DESKTOP in
    "KDE") kde;;
    "GNOME") gnome;;
esac

printf "\nEtapa 5/12: Instalando driver NVIDIA... \n\n"
sudo apt install nvidia-driver-450

printf "\nEtapa 6/12: Instalando o Steam... \n\n"
sudo apt install steam

printf "\nEtapa 7/12: Instalando Wine-Staging... \n\n"
sudo printf "deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04 ./" | sudo tee /etc/apt/sources.list.d/wine-obs.list
wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_20.04/Release.key | sudo apt-key add -
sudo apt update && sudo apt install winehq-staging

printf "\nEtapa 8/12: Instalando o Lutris... \n\n"
sudo add-apt-repository ppa:lutris-team/lutris && sudo apt update && sudo apt install lutris

printf "\nEtapa 9/12: Instalando o Google Chrome... \n\n"
wget -cO chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install ./chrome.deb

printf "\nEtapa 10/12: Instalando o Discord... \n\n"
wget -cO discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb

printf "\nEtapa 11/12: Adicionando Repositório Flathub... \n\n"
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

printf "\nEtapa 12/12: Instalando o Telegram [Flatpak]... \n\n"
flatpak install flathub org.telegram.desktop

printf "\nFIM DO SCRIPT \n\n"
