[back](https://github.com/sudoxreboot/linux-vr-wmr/blob/main/docs/game-insights/game-insights.md)


# star citizen

<h3>steps confirmed to work on kubuntu 2026.02.27</h3>

1. download the [LUG HELPER](https://github.com/starcitizen-lug/lug-helper/releases/tag/v4.10)
2. extract and run - example:

    ```
    tar -xzf /home/sudoxnym/Downloads/lug-helper-4.10.tar.gz
    ~/Downloads/lug-helper-4.10/lug-helper.sh
    ```
    - replace 4.10 with current downloaded version

3. allow preflight
4. most likely you failed preflight

   - adjust swap and vm.max_map_count

 
    ```
    echo "vm.max_map_count = 16777216" | sudo tee /etc/sysctl.d/99-starcitizen-max_map_count.conf && sudo mkdir -p /etc/systemd/system.conf.d && echo "DefaultLimitNOFILE=524288" | sudo tee /etc/systemd/system.conf.d/99-starcitizen-filelimit.conf && sudo sysctl --system && sudo systemctl daemon-reexec && TOTAL_RAM=$(free -m | awk '/^Mem:/{print $2}') && SWAP_NEEDED=$(( (40 * 1024 - TOTAL_RAM + 1023) / 1024 )) && if [ $SWAP_NEEDED -gt 0 ]; then if swapon --show | grep -q swapfile; then sudo swapoff $(swapon --show | grep swapfile | awk '{print $1}') && sudo rm -f /swapfile; fi; sudo sed -i '/swapfile/d' /etc/fstab; FS=$(df -T / | awk 'NR==2{print $2}'); if [ "$FS" == "btrfs" ]; then sudo btrfs subvolume create /swap && sudo fallocate -l ${SWAP_NEEDED}G /swap/swapfile && sudo chmod 600 /swap/swapfile && sudo btrfs property set /swap/swapfile compression none && sudo mkswap /swap/swapfile && sudo swapon /swap/swapfile && echo '/swap/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab && echo "created ${SWAP_NEEDED}gb swapfile on btrfs"; else sudo fallocate -l ${SWAP_NEEDED}G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab && echo "created ${SWAP_NEEDED}gb swapfile"; fi; else echo "swap sufficient, skipping"; fi
    ```
    
5. you need 150GB storage available. you may choose a different dir to contain the game. no HDD nor NTFS.
6. before closing lug helper, manage wine runners > install a runner from LUG Experimental > install the latest matching experimental runner ***must be greater than or equal to 11.2*** (i.e. lug-wine-tkg-staging-experimental-wayland-git-11.3-1)
7. launch with the desktop icon, the desktop entry or

    ```
    ~/Games/star-citizen/sc-launch.sh
    ```
    
8. log in, click install. **DO NOT** alter the default install location from ```C:\Program Files\Roberts Space Industries```
9. after install completes: select settings > enable VR (at the bottom of game settings)
10. launch game
11. once connected to a lobby and free to roam about the cabin, open settings (esc) and choose the tab on the far right labeled with VR, and enable experimental vr settings
12. **enjoy**

<h3>notes</h3>
vr controllers are not compatible, use mouse and keyboard or gamepad


<h3>see you in the 'verse!</h3>






attribution: [Star Citizen Lug](https://wiki.starcitizen-lug.org/Quick-Start-Guide)
