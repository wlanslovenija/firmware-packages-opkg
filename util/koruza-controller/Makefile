include $(TOPDIR)/rules.mk

PKG_NAME:=koruza-controller
PKG_VERSION:=0.3
PKG_RELEASE:=4
PKG_REV:=f38b6e6ba1357ca28aa681307fd037b5894f5981

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/IRNAS/koruza-controller.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/koruza-controller
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librt +libevent2 +zlib
  TITLE:=Simple KORUZA controller
endef

define Package/koruza-controller/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/koruza-control $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/koruza.cfg $(1)/etc/koruza.cfg
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/koruza-control-daemon.init $(1)/etc/init.d/koruza-control-daemon
	$(INSTALL_BIN) ./files/koruza-collector.init $(1)/etc/init.d/koruza-collector
	$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/koruza-collect $(1)/www/cgi-bin/koruza-collect
endef

$(eval $(call BuildPackage,koruza-controller))
