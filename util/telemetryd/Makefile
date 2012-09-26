include $(TOPDIR)/rules.mk

PKG_NAME:=telemetryd
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/wlanslovenija/telemetry.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/telemetryd
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librt +nodewatcher-core
  TITLE:=Telemetry Control Daemon
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/daemon/* $(PKG_BUILD_DIR)
endef

define Package/telemetryd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/telemetryd $(1)/usr/bin/telemetryd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/telemetry-command $(1)/usr/bin/telemetry-command
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/telemetryd.init $(1)/etc/init.d/telemetryd

        # Nodewatcher modules
        $(INSTALL_DIR) $(1)/etc/nodewatcher.d
        $(INSTALL_DATA) ./files/telemetry.sh $(1)/etc/nodewatcher.d/telemetry.sh
endef

$(eval $(call BuildPackage,telemetryd))
