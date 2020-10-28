fix_ubuntu_18_04_sound_pop_issue() {
    __heredoc__="""
    Script that fixes a popping sound due to a power saving feature

    References:
        https://superuser.com/questions/1493096/linux-ubuntu-speakers-popping-every-few-seconds
        https://www.youtube.com/watch?v=Pdmy8dMWitg
    """
    sudo echo "obtaining sudo"
    cat /sys/module/snd_hda_intel/parameters/power_save
    cat /sys/module/snd_hda_intel/parameters/power_save_controller
    sudo sh -c "echo 0 > /sys/module/snd_hda_intel/parameters/power_save"
    sudo sh -c "echo N > /sys/module/snd_hda_intel/parameters/power_save_controller"
    if [ -f "/etc/default/tlp" ]; then
        sudo sed -i 's/SOUND_POWER_SAVE_ON_BAT=1/SOUND_POWER_SAVE_ON_BAT=0/' /etc/default/tlp
        sudo sed -i 's/SOUND_POWER_SAVE_CONTROLLER=Y/SOUND_POWER_SAVE_CONTROLLER=N/' /etc/default/tlp
    elif [ -f "/etc/modprobe.d/alsa-base.conf" ]; then
        text="options snd-hda-intel power_save=0 power_save_controller=N"
        fpath="/etc/modprobe.d/alsa-base.conf"
        found="$(grep -F "$text" "$fpath")"
        if [ "$found" == "" ]; then sudo sh -c "echo \"$text\" >> $fpath"; fi
        cat "$fpath"
    else exit 1; fi
}
