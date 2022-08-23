# Bash scripts for dockerhost
[![Build Status](https://files.ariadata.co/file/ariadata_logo.png)](https://ariadata.co)

![](https://img.shields.io/github/stars/ariadata/dockerhost-sh.svg)
![](https://img.shields.io/github/watchers/ariadata/dockerhost-sh.svg)
![](https://img.shields.io/github/forks/ariadata/dockerhost-sh.svg)

#### This script also installs these packages:
* git
* curl , wget , nano
* software-properties-common , lsb-release , gnupg-agent , cron
* p7zip , sqlite3
* apt-transport-https , ca-certificates

---
### Debian 11 :
#### ✅`root` :
```sh
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-debian-11-root.sh)
```
#### ✅`non-root` :
 > ##### 1️⃣ Create `non-root` sudo-enabled user via `root` first. (if there is no non-root user) :
```sh
# run these commands as root user :
apt --yes install sudo
adduser production
usermod -aG sudo production
```
 > ##### 2️⃣ Install dockerhost via 'non-root' user :
```sh
bash <(curl -sSL https://github.com/ariadata/dockerhost-sh/raw/main/dockerhost-basic-debian-11-non-root.sh)
```
---

