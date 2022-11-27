#!/bin/bash
#current_folder="$(pwd)"

# clean all old files
bash clean.sh

# Making files
./scripts/feeds update -a
./scripts/feeds install -a

cp scripts/configurations .config
make V=s -j5

# update image builder
cd /home/vagrant/WRT3200ACM/bin/targets/mvebu/cortexa9
tar xvf openwrt-imagebuilder-mvebu-cortexa9.Linux-x86_64.tar.xz
mv openwrt-imagebuilder-mvebu-cortexa9.Linux-x86_64/ /home/vagrant/WRT3200ACM/openwrt-imagebuilder
rm -rfv openwrt-imagebuilder-mvebu-cortexa9.Linux-x86_64/

# copy builder
cd  ~/AR300M16-ext/openwrt-imagebuilder/
cp -avr ../overlay .
mv overlay/build.sh build.sh
mv overlay/repositories.conf repositories.conf
