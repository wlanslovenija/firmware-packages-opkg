#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lm4flash
PKG_VERSION:=0.1.3
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/utzig/lm4tools.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=1cfd813779b9eb717b15b0a1814bde8338899ff9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/lm4flash
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=lm4flash
  DEPENDS:=+libusb
endef

define Package/lm4flash/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lm4flash $(1)/usr/bin/lm4flash
endef

$(eval $(call BuildPackage,lm4flash))

