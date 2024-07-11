https://forums.debian.net/viewtopic.php?t=156263
https://wiki.debian.org/NvidiaGraphicsDrivers#sid-340
https://forums.debian.net/viewtopic.php?t=150559&start=20

### nvidia-340 driver

* Install nvidia-340 driver

	* Ubuntu

			$ sudo add-apt-repository ppa:kelebek333/nvidia-legacy
			$ sudo apt update
			$ sudo apt install nvidia-340 nvidia-settings

	* Debian

			$ sudo apt update && sudo apt upgrade
			$ sudo touch /etc/apt/sources.list.d/sid-repositories.list
			$ sudo nano /etc/apt/sources.list.d/sid-repositories.list

`````````````````````````````````````````````````````````````````
deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware

`````````````````````````````````````````````````````````````````

			$ sudo apt update
			$ sudo apt install nvidia-legacy-340xx-driver firmware-misc-nonfree
			$ sudo rm /etc/apt/sources.list.d/sid-repositories.list
			$ sudo reboot

* Set PCI-E registers during boot

		$ sudo nano /etc/grub.d/01_enable_vga.conf

`````````````````````````````````````````````````````````````````
cat << EOF
setpci -s "00:17.0" 3e.b=8
setpci -s "02:00.0" 04.b=7
EOF

`````````````````````````````````````````````````````````````````

		$ sudo chmod 755 /etc/grub.d/01_enable_vga.conf
		$ sudo update-grub
		$ reboot

### Spotify

		$ bash <(curl -sSL https://spotx-official.github.io/run.sh) -h --installdeb

### Stremio

		$ wget https://dl.strem.io/shell-linux/v4.4.168/stremio_4.4.168-1_amd64.deb
		$ sudo apt install ./stremio*amd64.deb

		$ wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
		$ sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
		$ wget http://archive.ubuntu.com/ubuntu/pool/multiverse/f/fdk-aac/libfdk-aac1_0.1.6-1_amd64.deb
		$ sudo dpkg -i libfdk-aac1_0.1.6-1_amd64.deb

### Post-installation

https://easylinuxtipsproject.blogspot.com/p/first-mint.html
https://www.reallinuxuser.com/21-best-things-to-do-after-installing-linux-mint/

### QRedshift

		$ sudo apt-get remove redshift-gtk
		$ curl https://github.com/raphaelquintao/QRedshiftCinnamon/raw/master/install.sh -sSfL | bash


https://www.reddit.com/r/linux/comments/72mfv8/psa_for_firefox_users_set_moz_use_xinput21_to/


sudo nano /etc/initramfs-tools/modules
Add the word z3fold to the end

sudo update-initramfs -u

Open your GRUB configuration file as the administrator. It helps for this part if you maximize the window so you can see what you’re doing.

sudo nano /etc/default/grub

Find the line that says “GRUB_CMDLINE_LINUX_DEFAULT=” and append this to the end of the kernel command line. MAKE SURE TO DO IT CORRECTLY, OR YOUR SYSTEM PROBABLY WON’T BOOT.

zswap.enabled=1 zswap.compressor=lz4 zswap.max_pool_percent=25 zswap.zpool=z3fold
