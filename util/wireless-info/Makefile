include $(TOPDIR)/rules.mk

PKG_NAME:=wireless-info
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_REV:=HEAD

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/wlanslovenija/wireless-info.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/wireless-info
  SECTION:=util
  CATEGORY:=Utilities
  DEPENDS:=+libnl-tiny
  TITLE:=Wireless information from MAC80211
endef

TARGET_CFLAGS += \
	-I$(STAGING_DIR)/usr/include/libnl-tiny \
	-I$(STAGING_DIR)/usr/include \
	-DLIBNL_TINY

define Build/Prepare
	$(call Build/Prepare/Default)
	sed -i s/-lnl/-lnl-tiny/g $(PKG_BUILD_DIR)/Makefile
endef

define Package/wireless-info/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wireless-info $(1)/usr/bin/wireless-info
endef

$(eval $(call BuildPackage,wireless-info))
