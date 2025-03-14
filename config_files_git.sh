
#!/bin/bash

# config directory
config_dir="/home/"$(whoami)"/.config/"

# home directory
home_dir="/home/"$(whoami)

# .config files to grab
config_apps_to_git="ardour8 autostart bashtop clipit cmus discord htop i3 nvim ranger picom.conf watch_tablet.yml volumeicon i3-scrot.conf"

# home apps to grab
home_apps_to_git=".Xresources .zshrc"

# no idea what's happening here but turns the string into a list
IFS=' ' read -r -a apps <<< "$config_apps_to_git"

# loop through the list of apps in .config files copying each
for app in ${apps[@]}
do
    echo $config_dir$app " is an app to get config files"
done

IFS=' ' read -r -a home_apps <<< "$home_apps_to_git"

for app in ${home_apps[@]}
do
    echo $home_dir$app " is an app to get in home"
done
