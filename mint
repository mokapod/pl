### nvidia-340 driver

* Install nvidia-340 driver

		$ sudo add-apt-repository ppa:kelebek333/nvidia-legacy
		$ sudo apt update
		$ sudo apt install nvidia-340 nvidia-settings

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
