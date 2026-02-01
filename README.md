<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/8036/8036322.png" />
</p>

# <span style="font-size: 42px;"><strong>how to set up vr on linux with wmr</strong></span>
with multi-monitor support


<h2>prerequisite</h2>

<span style="font-size: 12px;">- install cachyos</span>

<h2>install</h2>
  
<span style="font-size: 12px;">- open konsole</span>

<span style="font-size: 12px;">- run:</span>

<!--```
sudo pacman --noconfirm -Sy cachyos-gaming-meta wayland-protocols boost git-lfs onnxruntime krfb
paru -Sy --noconfirm monado-vulkan-layers-git envision-xr-git
sudo ln -sf /usr/lib/libboost_thread.so.1.89.0 /usr/lib/libboost_thread.so.1.88.0
sudo ln -sf /usr/lib/libboost_filesystem.so.1.89.0 /usr/lib/libboost_filesystem.so.1.88.0
sudo ln -sf /usr/lib/libboost_program_options.so.1.89.0 /usr/lib/libboost_program_options.so.1.88.0
sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so.1.88.0
sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so
```-->
```
sudo pacman --noconfirm -Sy cachyos-gaming-meta wayland-protocols boost git-lfs onnxruntime krfb
paru -Sy --noconfirm monado-vulkan-layers-git envision-xr-git
for lib in thread filesystem program_options; do sudo ln -sf /usr/lib/libboost_$lib.so.1.89.0 /usr/lib/libboost_$lib.so.1.88.0; done && sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so.1.88.0 && sudo ln -sf /usr/lib/libboost_atomic.so.1.89.0 /usr/lib/libboost_system.so
```
<span style="font-size: 12px;">(boost 1.89 doesn't work with envision, so we trick it)</span>


<h2><span style="font-size: 32px;"><strong>envision</strong></span></h2>
<span style="font-size: 12px;">
  
- launch envision


<details>
  <summary>choose WMR default from dropdown and duplicate</summary>
<p align="center">
  <img src="https://lvra.gitlab.io/images/EnvisionXR_WMR.png" />
</p></details> 
<p align="center">
<details>
  <summary>change config</summary>
  
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

enable krfb cursors
```WLR_NO_HARDWARE_CURSORS=1```
enable handtracking
```WMR_HANDTRACKING=1```

</details>   
  </p>
  
- save and build
- enable wayvr and wayvr dashboard plugin
- pair controllers (will probably say failed, ignore it)
  - if failed to connect: power cycle the controllers and they should connect
- plug in headset if not plugged in 
- press start

- [ this final step is a <strong>hard</strong> requirement or else don't follow this guide =p ]

<details>
  <summary>reveal final step</summary>
<p align="center"><span style="color: #FF0099; font-size: 96px;"><strong>enjoy!</strong></span></p>
</details>  
  
<strong><span style="font-size: 28px;">notes</span></strong>

- <strong>NEVER</strong> close envision while the game is running
- turn on controllers before starting the envision instance
</span>

<h2><span style="font-size: 32px;">multi-monitor</span></h2>

- to add an extra desktop for your wayvr desktop 
  - for multiple, change port
```
krfb-virtualmonitor --resolution 1920x1080 --name monitor_name --password password --port 5900
```
- configure in display configuration
  - set position
  - save



<h2><span style="font-size: 32px;">custom environment</span></h2>

- you may set a custom environment at ```~/.config/wayvr/conf.d:```
  
<strong>parameters:</strong>
  - .dds file supported only
  - image must be an equirectangular (aka "HDRI" or "Spherical 360") image.  

<strong>steps:</strong>  
- convert image
  (replace in and out with path to file and output file name)
```
IN="input.png" \
OUT="output.dds" \
sh -c 'magick convert "$IN" -define dds:compression=dxt5 "$OUT" && mkdir -p ~/.config/wayvr/conf.d/ && echo "skybox_texture: $OUT" > ~/.config/wayvr/conf.d/skybox.yaml'
```
  






<h2><span style="font-size: 32px;">custom plugins</span></h2>

<strong>wayvr updated (more stable)</strong> ```~/.local/bin/wayvr-updated```
```
paru -Syu wayvr-git --noconfirm && mkdir -p ~/.local/bin && printf "#!/usr/bin/env bash\n/usr/bin/wayvr --openxr\n" > ~/.local/bin/wayvr-updated && chmod +x ~/.local/bin/wayvr-updated
```

<strong>alvr</strong> ```~/.local/bin/alvr```
```
paru -Syu cuda ffnvcodec-headers alvr-git --noconfirm && mkdir -p ~/.local/bin && printf "#!/usr/bin/env bash\n/usr/bin/wayvr --openxr\n" > ~/.local/bin/alvr && chmod +x ~/.local/bin/alvr
```

<strong>apply</strong>
- in envision open plugins
- press +
- name plugin
- choose ~/.local/bin/wayvr-updated
- press add
- disable conflicting plugins



