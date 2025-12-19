#!/bin/bash

sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
sudo dnf install git mate-themes mate-desktop mate-session-manager caja mate-panel mate-control-center mate-terminal lightdm lightdm-gtk xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drivers xorg-x11-utils marco pluma -y
git clone https://github.com/neeeeow/Bluecurve.git
cd Bluecurve
cp -r Bluecurve/icons/* ~/.icons
cp -r Bluecurve/themes/* ~/.themes
gsettings set org.mate.peripherals-mouse cursor-theme 'mate-black'
gsettings set org.mate.interface gtk-theme 'TraditionalOk'
gsettings set org.mate.Marco.general theme 'TraditionalOk'
gsettings set org.mate.panel.menubar icon-name 'redhat-icon-panel-menu'
sudo dnf config-manager --set-enabled crb
sudo subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
sudo reboot
