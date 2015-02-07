include $(TOPDIR)/rules.mk

PKG_NAME:=koruza-controller
PKG_VERSION:=2015-02-07
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/IRNAS/koruza-controller.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=70900bfd1dce7d1090398036a839471bb9cda9d8
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
	$(INSTALL_DIR) $(1)/www/koruza
	ln -sf /tmp/koruza-collector.last_state $(1)/www/koruza/last_state
endef

$(eval $(call BuildPackage,koruza-controller))
