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
			
			**Do NOT reboot yet**

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
		$ sudo reboot

### Spotify

* Install Spotify from Software Mnager
* Apply SpotX-Bash

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

### Firefox trackpad scrolling

		$ echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh
		$ reboot

### zswap

		$ sudo nano /etc/initramfs-tools/initramfs.conf

`````````````````````````````````````````````````````````````````
MODULES=dep
COMPRESS=lz4

`````````````````````````````````````````````````````````````````

		$ sudo nano /etc/initramfs-tools/modules

`````````````````````````````````````````````````````````````````
lz4
lz4_compress
z3fold

`````````````````````````````````````````````````````````````````

		$ sudo update-initramfs -u

		$ sudo nano /etc/default/grub
		$ sudo nano /etc/default/grub.d/50_lmde.cfg

`````````````````````````````````````````````````````````````````
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash zswap.enabled=1 zswap.compressor=lz4 zswap.max_pool_percent=25 zswap.zpool=z3fold"

`````````````````````````````````````````````````````````````````
		
		$ sudo update-grub
		$ sudo reboot
		
		$ grep -R . /sys/module/zswap/parameters


### Decrease swap usage

		$ sudo nano /etc/sysctl.conf

`````````````````````````````````````````````````````````````````
# Decrease swap usage to a more reasonable level
vm.swappiness=30

`````````````````````````````````````````````````````````````````

### Blacklisting Bluetooth

		$ echo "blacklist btusb" | sudo tee /etc/modprobe.d/blacklist-bluetooth.conf

### Blacklisting built-in webcam

		$echo "blacklist uvcvideo" | sudo tee /etc/modprobe.d/blacklist-webcam.conf

https://askubuntu.com/questions/76081/brightness-not-working-after-installing-nvidia-driver
