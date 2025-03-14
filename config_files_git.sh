
#!/bin/bash

# variable definitions
# !!!!!!!!!!!!!!!!!!!!!!!! CHANGE ME to whereever you wanna make a copy of your .config files !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
output_dir=""
# config directory
config_dir="/home/"$(whoami)"/.config/"
# home directory
home_dir="/home/"$(whoami)"/"
# .config files to grab
config_apps_to_git="ardour8 autostart bashtop clipit cmus htop i3 nvim ranger picom.conf watch_tablet.yml volumeicon i3-scrot.conf"
# home apps to grab
home_apps_to_git=".Xresources .zshrc"

if [[ $output_dir == "" ]] || ! ( [ -d "$output_dir" ] ); then
    echo "make sure to set your output directory, and that the folder exists"
else
    # make a home and config file if it's not already there
    if [ ! -d $output_dir/config ]; then
	mkdir $output_dir/config
    fi

    if [ ! -d $output_dir/home ]; then
	mkdir $output_dir/home
    fi

    # no idea what's happening here but turns the string into a list
    IFS=' ' read -r -a apps <<< "$config_apps_to_git"

    # loop through the list of apps in .config files copying each
    for app in ${apps[@]}
    do
	echo $config_dir$app " is an app to get config files"
	# actually copy the files
	cp -r $config_dir$app $output_dir/config/$app
    done

    IFS=' ' read -r -a home_apps <<< "$home_apps_to_git"

    for app in ${home_apps[@]}
    do
	echo $home_dir$app " is an app to get in home"
	cp -r $home_dir$app $output_dir/home/$app 
    done
fi
