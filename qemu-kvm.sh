#!/bin/bash
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager --no-install-suggests --no-install-recommends -y
sudo usermod -aG libvirt $(whoami)
sudo usermod -aG libvirt-qemu $(whoami)
sudo systemctl enable --now libvirtd
systemctl status libvirtd
