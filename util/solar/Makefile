include $(TOPDIR)/rules.mk

PKG_NAME:=solar
PKG_VERSION:=0.1
PKG_RELEASE:=14
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/wlanslovenija/solar.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/solar
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=
  TITLE:=Solar Manager
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/src/* $(PKG_BUILD_DIR)
endef

define Package/solar/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/solar $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/solar.init $(1)/etc/init.d/solar
endef

$(eval $(call BuildPackage,solar))
