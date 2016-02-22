# Installation
```
sudo emerge app-portage/layman
sudo echo "source /var/lib/layman/make.conf" >> /etc/portage/make.conf
git clone https://github.com/mmikitka/gentoo-overlay.git $DESTDIR
sudo mkdir -p /etc/portage/repos.conf
```

Add the following /etc/portage/repos.conf/local.conf
```
[mmikitka]
location = $DESTDIR
masters = gentoo
auto-sync = no
```
