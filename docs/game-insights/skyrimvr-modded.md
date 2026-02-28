[back](https://github.com/sudoxreboot/linux-vr-wmr/blob/main/docs/game-insights/game-insights.md)

# skyrim vr modded

1. install steam via the .deb

    ```
    wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
    sudo dpkg -i steam.deb
    sudo apt --fix-broken install  # handles any missing deps
    ```

2. install protonup-qt and create desktop entry
    ```
    curl -s https://api.github.com/repos/DavidoTek/ProtonUp-Qt/releases/latest \
      | grep "browser_download_url.*AppImage" \
      | cut -d '"' -f 4 \
      | xargs -I {} wget {} -O ~/.local/bin/protonup-qt \
      && chmod +x ~/.local/bin/protonup-qt \
      && cat > ~/.local/share/applications/protonup-qt.desktop << EOF
    [Desktop Entry]
    Name=ProtonUp-Qt
    Exec=$HOME/.local/bin/protonup-qt
    Icon=$HOME/Pictures/icons/protonup-qt.png
    Type=Application
    Categories=Game;
    EOF
    ```

3. open protonup-qt either via the app launcher or

    ```
    protonup-qt
    ```

4. click add version > compatibility tool > ge-proton > install (should default to latest version - ge-proton10-32 confirmed working on cachyos and kubuntu)
5. click add version > compatibility tool > steamtinkerlaunch > install (should default to latest version)
6. launch and login to steam
7. install skyrimvr
8. right click skyrimvr in the left panel of library > properties
9. set launch options:
      
    ```
    PRESSURE_VESSEL_FILESYSTEMS_RW="$XDG_RUNTIME_DIR/wivrn_comp_ipc:$XDG_RUNTIME_DIR/wivrn/comp_ipc:$XDG_RUNTIME_DIR/monado_comp_ipc" %command%
    ```
10. choose compatibility tab > &#x2713; force the use of a specific steam play compatibility tool > select steam tinker launch > close properties
11. launch game > a new menu will appear, but its quick, click main menu in the lower right before it vanishes
12. choose game menu at the bottom
13. proton options
      - proton version
        - GE-Proton10-32
14. save > main menu
15. steam first run setup > (this is probably overkill, but it works...) &#x2713; add on all scripts > save as addon
16. launch game, allow shaders to load, when you see the bethesda logo, close the game
17. steam > skyrimvr > stop > play > main menu
18. install and extract sksevr to game dir
    ```
    wget https://skse.silverlock.org/beta/sksevr_2_00_12.7z -O /tmp/sksevr.7z
    7z e /tmp/sksevr.7z -o"$HOME/.local/share/Steam/steamapps/common/SkyrimVR/"
    rm /tmp/sksevr.7z
    ```
19. game menu > use custom command > ~/.local/share/Steam/steamapps/common/SkyrimVR/sksevr_loader.exe > save
20. vortex (mo2 may work, but i like vortex more, i know.. 'weird') > install > ge-proton10-32 (or latest) > install
21. this will take awhile, it will pop an error saying that it isnt compatible, press ignore
22. when it stops it may auto launch (cant remember and mines installed already) if not, press start to launch vortex
23. game > skyrimvr > manage
24. install any mods as usual
25. play
26. enjoy!

<h3>notes</h3>

- you can now just launch skyrim, let it do its timeout on the menus for stl and itll auto launch the game

- you *CAN* make wabbajack playlists work, but imo its not worth it, you press play in mo2 and it takes 6 minutes to launch, i spent 4 days thinking it just told me to f off silently.
