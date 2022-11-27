#!/bin/bash

make image \
     PROFILE="linksys_wrt3200acm" \
     FILES="overlay"

cp -avr bin/targets/mvebu/cortexa9/openwrt-mvebu-cortexa9-linksys_wrt3200acm-squashfs-sysupgrade.bin ~/wrt3200acm-squashfs-sysupgrade.bin


