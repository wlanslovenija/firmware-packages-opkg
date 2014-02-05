#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mspdebug
PKG_VERSION:=0.22
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://git.code.sf.net/p/mspdebug/code
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=ad4e27c1a2caa2a489384ead095a2d7ec610e06e
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/mspdebug
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Debugger for use with MSP430 MCUs
  DEPENDS:=+libusb +libpthread +libreadline
endef

define Package/mspdebug/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mspdebug $(1)/usr/bin/mspdebug
endef

$(eval $(call BuildPackage,mspdebug))

