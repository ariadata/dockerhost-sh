#!/bin/sh

set -e
clear

function get_latest_github_release_number() {
	# curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
	curl --silent "https://api.github.com/repos/$1/releases/latest" | jq -r '.name'
}

# Change System timezone
read -e -p $'Set Default System Timezone : ' -i "Europe/Istanbul" system_default_timezone
sudo timedatectl set-timezone $system_default_timezone

sudo sed -i 's/SELINUX=[^\s]+/SELINUX=disabled/g' /etc/selinux/config
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum makecache --refresh

sudo yum update -y

sudo yum install -y wget curl git nano sqlite p7zip ca-certificates jq yum-utils

sudo yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl enable --now docker
sudo chmod 666 /run/docker.sock

# compose-switch
curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sudo sh
#docker_compose_latest_version="$(get_latest_github_release_number docker/compose)"
#sudo curl -L "https://github.com/docker/compose/releases/download/$docker_compose_latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
#sudo chmod +x /usr/bin/docker-compose

sudo yum update -y && sudo yum autoremove -y

clear

echo -e $'\n=====================================\n\e[32mDockerHost successfully installed.\033[0m\n=====================================\n'
## reboot at the end
read -e -p $'Do you want to \e[31mreboot now\033[0m ? : ' -i "y" if_reboot_at_end
if [[ $if_reboot_at_end =~ ^([Yy])$ ]]
then
	sudo reboot
	exit
fi
