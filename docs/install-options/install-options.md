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


