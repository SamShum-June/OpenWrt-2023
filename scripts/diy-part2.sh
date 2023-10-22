#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

sed -i 's/depends on PACKAGE_python3-pymysql/#depends on PACKAGE_python3-pymysql/g' feeds/packages/lang/python/pymysql/Config.in
sed -i 's/PKG_RELEASE:=1/PKG_RELEASE:=2/g' feeds/packages/lang/python/pymysql/Makefile

# Add Lienol's Packages
pushd ./package/feeds
git clone --depth=1 https://github.com/Lienol/openwrt-package openwrt-package

# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/SamShum-June/helloworld.git helloworld
rm -rf ./helloworld/v2ray-plugin

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages.git passwall_packages
git clone --depth=1 https://github.com/SamShum-June/openwrt-passwall.git openwrt-passwall1
mv  ./openwrt-passwall1/luci-app-passwall ./luci/ 
rm -rf ./openwrt-passwall1
popd





# Add luci-app-vssr <M>
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
#git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-proto-minieap
#git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
#git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
#git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner


# Add subconverter
#git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Mod zzz-default-settings
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
#popd

# Change default shell to zsh
#sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd


