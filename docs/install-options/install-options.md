# installation:

open konsole

run:

<details>
  <summary><h3>cachyos</h3></summary>
<p align="center">
  
```
curl -fsSL https://raw.githubusercontent.com/sudoxreboot/linux-vr-wmr/main/linux-vr-wmr.sh | bash
```

i have added flags for those if you for whatever reason don't trust aur krfb (probably already installed anyway by default with your plasma) or if you, like me, don't actually need to use the headset for a virtual desktop.

<details>
  <summary>flag options:</summary>
<p align="center">

```--no-krfb``` skips krfb

```--no-desktop``` skips wayvr skybox setup 
</p>
</details>  




<details>
  <summary>what this script does</summary>
<p align="center">
  
  - detect gpu
  
  - updates and installs system and vr packages and krfb for virtual desktop
  
  - updates gpu driver
  
  - symlink boost for compatibility, envision requires libboost.so 1.88.0 so we just tell it that 1.89.0 IS 1.88.0 becasue downgrading breaks system packages
  
  - downloads, converts, and applies my favorite environment for within the wayvr environment, this is just a bonus, i got bored with stock wayvr
</p>
</details>  

</p>
</details>  

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
```
WLR_NO_HARDWARE_CURSORS=1
```

enable handtracking
```
WMR_HANDTRACKING=1
```
fix mod launcher launched xrizer crash
```
XRT_COMPOSITOR_SCALE_PERCENTAGE=100
```


</details>   
  </p>
  
save and build

optional: enable wayvr plugin

optional: enable stardust plugin

pair controllers (will probably say failed, ignore it)
- if failed to connect: power cycle the controllers and they should connect

plug in headset if not plugged in 

press start

[ this final step is a <strong>hard</strong> requirement or else don't follow this guide =p ]

<details>
  <summary>reveal final step</summary>
<p align="center"><span style="color: #FF0099; font-size: 96px;"><strong>enjoy!</strong></span></p>
</details>  
  
<strong><span style="font-size: 28px;">notes</span></strong>

- <strong>NEVER</strong> close envision while the game is running
- turn on controllers before starting the envision instance
</span>
