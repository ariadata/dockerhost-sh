# Bash scripts for install docker (+compose) on linux
[![Build Status](https://raw.githubusercontent.com/ariadata/ariadata-files/main/public-assets/images/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/dockerhost-sh.svg)
![](https://img.shields.io/github/watchers/ariadata/dockerhost-sh.svg)
![](https://img.shields.io/github/forks/ariadata/dockerhost-sh.svg)

#### This script also installs these packages:
* git , curl , wget , nano , p7zip , sqlite3

<details>
  <summary>✅ Debian 11 :</summary>

Run these commands for upgrade problem as `root` :
```sh
hwclock --hctosys
apt --yes install ntp
systemctl enable --now ntp
systemctl restart ntp
dpkg-reconfigure tzdata
```
#### 🔷`non-root` recommended :
 > ##### 1️⃣ Create `non-root` sudo-enabled user via `root` first. (if there is no non-root user) :
```sh
# run these commands as root user :
# make sure sudo is installed
apt --yes install sudo

adduser production
usermod -aG sudo production
```
 > ##### 2️⃣ Install dockerhost via 'non-root' user :
```sh
sudo apt --yes install curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-debian-11-non-root.sh)
```
#### 🔷`root` :
```sh
apt --yes install curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-debian-11-root.sh)
```
</details>

<details>
  <summary>✅ Ubuntu 20+:</summary>

#### 🔷`non-root` recommended :
 > ##### 1️⃣ Create `non-root` sudo-enabled user via `root` first. (if there is no non-root user) :
```sh
# run these commands as root user :
# make sure sudo is installed
apt --yes install sudo

adduser production
usermod -aG sudo production
```
 > ##### 2️⃣ Install dockerhost via 'non-root' user :
```sh
sudo apt --yes install curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-ubuntu-non-root.sh)
```
#### 🔷`root` :
```sh
apt --yes install curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-ubuntu-root.sh)
```
</details>

<details>
  <summary>✅ Rocky Linux 9 :</summary>

#### 🔷`non-root` recommended :
 > ##### 1️⃣ Create `non-root` sudo-enabled user via `root` first. (if there is no non-root user) :
```sh
# run these commands as root user :
# make sure sudo is installed
yum install -y sudo

adduser production
passwd production
usermod -aG wheel production
```
 > ##### 2️⃣ Install dockerhost via 'non-root' user :
```sh
sudo yum install -y curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-rocky-9-non-root.sh)
```
#### 🔷`root` :
```sh
yum install -y curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-rocky-9-root.sh)
```
</details>

<details>
  <summary>✅ Rocky Linux 8 :</summary>

#### 🔷`non-root` recommended :
 > ##### 1️⃣ Create `non-root` sudo-enabled user via `root` first. (if there is no non-root user) :
```sh
# run these commands as root user :
# make sure sudo is installed
yum install -y sudo

adduser production
passwd production
usermod -aG wheel production
```
 > ##### 2️⃣ Install dockerhost via 'non-root' user :
```sh
sudo yum install -y curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-rocky-8-non-root.sh)
```
#### 🔷`root` :
```sh
yum install -y curl
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-rocky-8-root.sh)
```
</details>
