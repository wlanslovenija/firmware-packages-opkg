#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=babeld
PKG_VERSION:=1.7.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_VERSION:=1b9777ce74e4898dba42ba714d9d35424ffa6fa9
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.xz
PKG_SOURCE_URL:=https://github.com/jech/babeld.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_MIRROR_HASH:=42b4dfefaad201dcd0f020fcdc68b03ae97e65f4074f1f7e002be22719391b54
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/babeld
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=A loop-free distance-vector routing protocol
  URL:=http://www.pps.univ-paris-diderot.fr/~jch/software/babel/
  MAINTAINER:=Gabriel Kerneis <gabriel@kerneis.info>
  DEPENDS:=+@IPV6
endef

define Package/babeld/description
 Babel is a loop-avoiding distance-vector routing protocol roughly based
 on DSDV and AODV, but with provisions for link cost estimation and
 redistribution of routes from other routing protocols.
 While it is optimised for wireless mesh networks, Babel will also work
 efficiently on wired networks. It will generate between 1.2 and 2.4 times
 the amount of routing traffic that RIPng would generate, while
 never counting to infinity.
endef

define Package/babeld/conffiles
/etc/babeld.conf
/etc/config/babeld
endef

MAKE_FLAGS+= \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDLIBS="" \

define Package/babeld/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/babeld $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/babeld.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/babeld.config $(1)/etc/config/babeld
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/babeld.init $(1)/etc/init.d/babeld
endef

$(eval $(call BuildPackage,babeld))
