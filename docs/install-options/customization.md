# customization

<h3><span style="font-size: 32px;">multi-monitor</span></h3>

- to add an extra desktop for your wayvr desktop 
  - for multiple, change port
```
krfb-virtualmonitor --resolution 1920x1080 --name monitor_name --password password --port 5900
```
- configure in display configuration
  - set position
  - save

<h3><span style="font-size: 32px;">custom environment</span></h3>

- you may set a custom environment at ```~/.config/wayvr/conf.d:```
  
<strong>parameters:</strong>
  - .dds file supported only
  - image must be an equirectangular (aka "hdri" or "spherical 360") image.  

<strong>steps:</strong>  
- convert image
  (replace in and out with path to file and output file name)
```
IN="input.png" \
OUT="output.dds" \
sh -c 'magick "$IN" -define dds:compression=dxt5 "$OUT" && mkdir -p ~/.config/wayvr/conf.d/ && echo "skybox_texture: $OUT" > ~/.config/wayvr/conf.d/skybox.yaml'
```
