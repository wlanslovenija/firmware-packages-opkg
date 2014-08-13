include $(TOPDIR)/rules.mk

PKG_NAME:=koruza-controller
PKG_VERSION:=2014-08-13
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/IRNAS/koruza-controller.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=ecbd2af9b193e8480d3a2b2252b33f4b17596eab
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Jernej Kos <jernej@kos.mx>

include $(INCLUDE_DIR)/package.mk

define Package/koruza-controller
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librt +libevent2 +zlib +lm4flash
  TITLE:=Simple KORUZA controller
endef

define Package/koruza-controller/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/koruza-control $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/koruza.cfg $(1)/etc/koruza.cfg
	$(INSTALL_DIR) $(1)/etc/koruza
	$(INSTALL_BIN) ./files/device_reset $(1)/etc/koruza/device_reset
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/koruza-control-daemon.init $(1)/etc/init.d/koruza-control-daemon
	$(INSTALL_BIN) ./files/koruza-collector.init $(1)/etc/init.d/koruza-collector
	$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/koruza-collect $(1)/www/cgi-bin/koruza-collect
endef

$(eval $(call BuildPackage,koruza-controller))
