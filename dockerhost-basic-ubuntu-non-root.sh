#!/bin/sh
set -e
clear

function get_latest_github_release_number() {
	# curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
	curl --silent "https://api.github.com/repos/$1/releases/latest" | jq -r '.name'
}

read -e -p $'Update && Upgrade System first [y/n]? : ' -i "y" if_update_first

# Change System timezone
read -e -p $'Set Default System Timezone : ' -i "Europe/Istanbul" system_default_timezone
sudo timedatectl set-timezone $system_default_timezone

if [[ $if_update_first =~ ^([Yy])$ ]]
then
	sudo apt --yes update && sudo apt -q --yes upgrade
fi

sudo apt --yes install wget curl git nano lsb-release sqlite3 p7zip gnupg-agent apt-transport-https ca-certificates software-properties-common jq cron
sudo systemctl enable --now cron


bash <(curl -sSL -fsSL https://get.docker.com)
sudo usermod -aG docker $USER
sudo systemctl enable --now docker
sudo chmod 666 /var/run/docker.sock

curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh
# docker_compose_latest_version="$(get_latest_github_release_number docker/compose)"
# sudo curl -L "https://github.com/docker/compose/releases/download/$docker_compose_latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
# sudo chmod +x /usr/bin/docker-compose

sudo apt --yes remove snapd --purge
sudo rm -rf ~/snap /var/snap /var/lib/snapd
sudo apt --yes update && sudo apt -q --yes upgrade && sudo apt --yes autoremove

clear

echo -e $'\n=====================================\n\e[32mDockerHost successfully installed.\033[0m\n=====================================\n'
## reboot at the end
read -e -p $'Do you want to \e[31mreboot now\033[0m ? : ' -i "y" if_reboot_at_end
if [[ $if_reboot_at_end =~ ^([Yy])$ ]]
then
	sudo reboot
	exit
fi
