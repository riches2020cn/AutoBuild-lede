#!/bin/bash
#=================================================
# Copyright (c) 2019-2023 sky2016cn
# Author: sky2016cn
# licensed under the MIT License
# See /LICENSE for more information
# Description: Build OpenWrt using GitHub Actions
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' immortalwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' immortalwrt/package/lean/default-settings/files/zzz-default-settings

#3. 修改WiFi名称为Hello，密码password，只适用于硬路由，注意有两处保存路径
sed -i 's/set wireless.default_${name}.ssid=ImmortalWrt/set wireless.default_${name}.ssid=Hello/g; s/set wireless.default_${name}.encryption=none/set wireless.default_${name}.encryption=psk-mixed/g' immortalwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_${name}.encryption=psk-mixed/a \                        set wireless.default_${name}.key=password' immortalwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh
#4. 修改默认皮肤
#sed -i 's/+luci-theme-bootstrap/+luci-theme-argon/g' immortalwrt/feeds/luci/collections/luci/Makefile

#5. Replace with JerryKuKu’s Argon
#rm immortalwrt/package/lean/luci-theme-argon -rf
