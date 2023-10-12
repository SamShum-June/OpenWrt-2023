#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package'
sed -i '$a src-git helloworld https://github.com/SamShum-June/helloworld'
sed -i '$a src-git openwrt-package https://github.com/SamShum-June/openwrt-package'
sed -i '$a src-git openwrt-passwall https://github.com/SamShum-June/openwrt-passwall'
sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages'
sed -i '$a src-git luci-theme-argon https://github.com/SamShum-June/luci-theme-argon'


# Svn checkout packages from immortalwrt's repository
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/packages
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/luci

