<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/8036/8036322.png" />
</p>

# how to set up vr on linux with wmr
install cachyos
```
sudo pacman -Sy cachyos-gaming-meta
paru -Sy monado-vulkan-layers-git
paru -Sy envision-xr-git
sudo pacman -Syu boost boost boost boost boost boost bzip2 fmt glew clang libdrm libusb openxr sdl2 vulkan-icd-loader wayland intel-tbb
sudo ln -s /usr/lib/libboost_thread.so.1.89.0 /usr/lib/libboost_thread.so.1.88.0
sudo ln -s /usr/lib/libboost_filesystem.so.1.89.0 /usr/lib/libboost_filesystem.so.1.88.0
sudo ln -s /usr/lib/libboost_program_options.so.1.89.0 /usr/lib/libboost_program_options.so.1.88.0
sudo ln -s /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so.1.88.0
sudo ln -s /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so
```
(boost 1.89 doesn't work with envision, so we trick it)

launch envision

(source: https://lvra.gitlab.io/docs/fossvr/envision/wmr_controllers_on_arch/)

choose WMR default from dropdown
<p align="center">
  <img src="https://lvra.gitlab.io/images/EnvisionXR_WMR.png" />
</p>
duplicate

xr service repo:

https://gitlab.freedesktop.org/thaytan/monado

xr service branch:

dev-constellation-controller-tracking

<p align="center">
  <img src="https://lvra.gitlab.io/images/wmr_controller_tracking_envision.png" />
</p>
environment variables:
WLR_NO_HARDWARE_CURSORS=1 (enables krfb cursors)

save and build

enable wayvr and wayvr dashboard plugin

turn on controllers, plug in headset if not plugged in 

<strong>NEVER</strong> close envision while the game is running

turn on controllers before starting the envision instance
