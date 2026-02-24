#!/bin/bash
set -e

echo "detecting gpu..."

# detect gpu vendor
if lspci | grep -i vga | grep -iq nvidia; then
    GPU="nvidia"
    echo "detected nvidia gpu"
elif lspci | grep -i vga | grep -iq amd; then
    GPU="amd"
    echo "detected amd gpu"
elif lspci | grep -i vga | grep -iq intel; then
    GPU="intel"
    echo "detected intel gpu"
else
    echo "could not detect gpu. please install drivers manually."
    exit 1
fi

echo "updating system and installing vr packages..."
paru -Syu --noconfirm \
    cachyos-gaming-meta \
    bc \
    wayland-protocols \
    boost \
    git-lfs \
    onnxruntime \
    krfb \
    steam \
    monado-vulkan-layers-git \
    envision-xr-git

#feature in progress - nvidia should be complete - don't own amd or intel for testing
#Rdd used because pacman wont uninstall the drivers with packages installed that use them easily
#echo "installing $GPU drivers..."
case $GPU in
    nvidia)
        echo "reinstalling nvidia drivers..."
        sudo pacman -Rdd $(pacman -Qq | grep "nvidia-lts" || pacman -Qq | grep "nvidia") 

        sudo pacman -S --noconfirm --needed \
            extra/nvidia-dkms \
            nvidia-utils \
            lib32-nvidia-utils \
            nvidia-settings
        ;;
#    amd)
#        echo "updating amd drivers"
#        sudo pacman -Rdd $(pacman -Qq | grep "amd-lts" || pacman -Qq | grep "amd")
#        
#        paru -Syu --noconfirm \
#            mesa \
#            lib32-mesa \
#            vulkan-radeon \
#            lib32-vulkan-radeon \
#            libva-mesa-driver \
#            lib32-libva-mesa-driver \
#            mesa-vdpau \
#            lib32-mesa-vdpau
#        ;;
#    intel)
#        echo "updating intel drivers"
#        sudo pacman -Rdd $(pacman -Qq | grep "intel-lts" || pacman -Qq | grep "intel")
#        paru -Syu --noconfirm \
#            mesa \
#            lib32-mesa \
#            vulkan-intel \
#            lib32-vulkan-intel \
#            intel-media-driver
#        ;;
esac
# need to sumlink libboost to 1.88.0 for envision. force downgrade breaks other packages on system.
echo "creating boost symlinks for compatibility..."
sudo ln -sf /usr/lib/libboost_thread.so.1.89.0 /usr/lib/libboost_thread.so.1.88.0
sudo ln -sf /usr/lib/libboost_filesystem.so.1.89.0 /usr/lib/libboost_filesystem.so.1.88.0
sudo ln -sf /usr/lib/libboost_program_options.so.1.89.0 /usr/lib/libboost_program_options.so.1.88.0
sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so.1.88.0
sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so

echo "downloading and converting skybox texture..."
mkdir -p ~/Pictures/wayvr_environments/
wget -O ~/Pictures/wayvr_environments/nebula.jpg \
    'https://raw.githubusercontent.com/sudoxreboot/linux-vr-wmr/main/wayvr_environments/nebula.jpg'

magick "$HOME/Pictures/wayvr_environments/nebula.jpg" \
    -define dds:compression=dxt5 \
    "$HOME/Pictures/wayvr_environments/nebula.dds"

echo "configuring wayvr skybox..."
mkdir -p ~/.config/wayvr/conf.d/
echo "skybox_texture: $HOME/Pictures/wayvr_environments/nebula.dds" > ~/.config/wayvr/conf.d/skybox.yaml

echo "setup complete! launch envision and configure."
