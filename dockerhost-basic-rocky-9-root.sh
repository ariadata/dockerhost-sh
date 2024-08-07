#!/bin/sh

set -e
clear

function get_latest_github_release_number() {
	# curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
	curl --silent "https://api.github.com/repos/$1/releases/latest" | jq -r '.name'
}

# Change System timezone
read -e -p $'Set Default System Timezone : ' -i "Europe/Istanbul" system_default_timezone
timedatectl set-timezone $system_default_timezone

sed -i 's/SELINUX=[^\s]+/SELINUX=disabled/g' /etc/selinux/config
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
yum makecache --refresh

yum update -y

yum install -y wget curl git nano sqlite p7zip ca-certificates jq yum-utils htop zstd

yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable --now docker
chmod 666 /run/docker.sock

# compose-switch
curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh
#docker_compose_latest_version="$(get_latest_github_release_number docker/compose)"
#curl -L "https://github.com/docker/compose/releases/download/$docker_compose_latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
#chmod +x /usr/bin/docker-compose

yum update -y && yum autoremove -y

clear

echo -e $'\n=====================================\n\e[32mDockerHost successfully installed.\033[0m\n=====================================\n'
## reboot at the end
read -e -p $'Do you want to \e[31mreboot now\033[0m ? : ' -i "y" if_reboot_at_end
if [[ $if_reboot_at_end =~ ^([Yy])$ ]]
then
	reboot
	exit
fi