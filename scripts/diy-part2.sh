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

# Add luci-theme-argon
pushd ./luci/themes
rm -rf ./luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
pushd ./luci-theme-argon
rm -rf ./RELEASE_ZH.md RELEASE.md README_ZH.md README.md LICENSE .gitignore .git .github
popd
popd
ln -sf ../../../luci/themes/luci-theme-argon ./package/feeds/luci/
ln -sf ../../../luci/themes/luci-theme-bootstrap-mod ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-autoreboot ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-cifs-mount ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-rclone ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-webadmin ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-zerotier ./package/feeds/luci/
ln -sf ../../../packages/net/dns-forwarder ./package/feeds/packages/

# Add luci-app-ssr-plus
pushd ./package/feeds
##git clone --depth=1 https://github.com/SamShum-June/helloworld
git clone --depth=1 https://github.com/fw876/helloworld helloworld
rm -rf ./helloworld/luci-app-naiveproxy

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package openwrt-package
rm -rf ./openwrt-package/luci-app-kodexplorer

# Clone community packages to package/community
#mkdir -p ./community
#pushd ./community
#popd

# Add luci-app-dockerman
#rm -rf ./luci/luci-lib-docker
#rm -rf ./luci/luci-app-dockerman
#pushd ./community
#git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
#git clone --depth=1 https://github.com/lisaac/luci-lib-docker
#popd
#popd
#popd
#ln -sf ../../.././package/feeds/community/luci-lib-docker/collections/luci-lib-docker ./package/feeds/luci/
#ln -sf ../../.././package/feeds/community/luci-app-dockerman/applications/luci-app-dockerman ./package/feeds/luci/

# Add luci-app-passwall
#pushd ./package/feeds/community
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
#popd
#popd
#popd
#popd
#popd
#ln -sf ../../.././package/feeds/community/openwrt-passwall/luci-app-passwall ./package/feeds/luci/




# Add immortalwrt's Packages
#git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/packages
#git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/luci
#cp -r ../luci/applications/luci-app-adguardhome ../package/lean//luci-app-adguardhome

#git clone --depth=1 https://github.com/AdguardTeam/AdGuardHome.git luci-app-adguardhome


# Add luci-app-passwall
#git clone --depth=1 https://github.com/SamShum-June/openwrt-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

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


# Add luci-theme-argon
#git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
#rm -rf ../lean/luci-theme-argon

# Add subconverter
#git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter


# Add OpenAppFilter
#git clone --depth 1 -b oaf-3.0.1 https://github.com/destan19/OpenAppFilter.git



# Mod zzz-default-settings
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
#popd


# Fix mt76 wireless driver
#pushd package/kernel/mt76
#sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
#popd

# Change default shell to zsh
#sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

