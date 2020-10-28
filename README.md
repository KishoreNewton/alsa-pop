# FIX UBUNTU BUZZ AND CRACK OR POPPING SOUND

    Script that fixes a popping sound due to a power saving feature

    References:
        https://superuser.com/questions/1493096/linux-ubuntu-speakers-popping-every-few-seconds
        https://www.youtube.com/watch?v=Pdmy8dMWitg


## Automatic 
Run

fix-ubuntu-sound.sh from terminal

### Manual 

Edit  **/etc/modprobe.d/alsa-base.conf**  and add or edit

```conf
options snd-hda-intel power_save=0 power_save_controller=N
```
Edit **/sys/module/snd_hda_intel/parameters/power_save** change value to

```conf
0
```

Edit **/sys/module/snd_hda_intel/parameters/power_save_controller** change value to

```conf
N
```

## Reboot to verify 
