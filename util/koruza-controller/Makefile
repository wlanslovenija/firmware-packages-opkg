include $(TOPDIR)/rules.mk

PKG_NAME:=koruza-controller
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/IRNAS/koruza-controller.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/koruza-controller
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librt
  TITLE:=Simple KORUZA controller
endef

define Package/koruza-controller/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/koruza-control $(1)/usr/bin/
endef

$(eval $(call BuildPackage,koruza-controller))
