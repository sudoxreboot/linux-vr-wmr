<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/8036/8036322.png" />
</p>

# <span style="font-size: 42px;"><strong>how to set up vr on linux with wmr</strong></span>
<h2>prerequisite</h2>

<span style="font-size: 12px;">- install cachyos</span>

<h2>install</h2>
  
<span style="font-size: 12px;">- open konsole</span>
<span style="font-size: 12px;">- run:</span>
```
sudo pacman --noconfirm -Sy cachyos-gaming-meta wayland-protocols boost git-lfs onnxruntime
paru -Sy --noconfirm monado-vulkan-layers-git envision-xr-git

sudo ln -s /usr/lib/libboost_thread.so.1.89.0 /usr/lib/libboost_thread.so.1.88.0
sudo ln -s /usr/lib/libboost_filesystem.so.1.89.0 /usr/lib/libboost_filesystem.so.1.88.0
sudo ln -s /usr/lib/libboost_program_options.so.1.89.0 /usr/lib/libboost_program_options.so.1.88.0
sudo ln -s /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so.1.88.0
sudo ln -s /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so
```
<span style="font-size: 12px;">(boost 1.89 doesn't work with envision, so we trick it)</span>


<h2><span style="font-size: 32px;"><strong>envision</strong></span></h2>
<span style="font-size: 12px;">- launch envision

-choose WMR default from dropdown

<details>
  <summary>image</summary>
<p align="center">
  <img src="https://lvra.gitlab.io/images/EnvisionXR_WMR.png" />
</p></details>      
  
- duplicate and change:

<span style="font-size: 22px;"><strong>xr service repo:</strong></span>
```
https://gitlab.freedesktop.org/thaytan/monado
```
<span style="font-size: 22px;"><strong>xr service branch:</strong></span>

```
dev-constellation-controller-tracking
```
<details>
  <summary>image</summary>


<p align="center">
  <img src="https://lvra.gitlab.io/images/wmr_controller_tracking_envision.png" />
</p></details>  
<span style="font-size: 22px;"><strong>environment variables:</strong></span>

(enables krfb cursors)
```
WLR_NO_HARDWARE_CURSORS=1
```
- save and build
- enable wayvr and wayvr dashboard plugin
- turn on controllers, plug in headset if not plugged in 
- press start

- [ this final step is a <strong>hard</strong> requirement or else don't follow this guide =p ]

<details>
  <summary>reveal final step</summary>
<p align="center"><span style="color: #FF0099; font-size: 96px;"><strong>enjoy!</strong></span></p>
</details>  
  





  <h2><span style="font-size: 32px;">notes</span></h2>

- <strong>NEVER</strong> close envision while the game is running
- turn on controllers before starting the envision instance
</span>
