include $(TOPDIR)/rules.mk

PKG_NAME:=netmeasured
PKG_VERSION:=2015-12-13
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/wlanslovenija/netmeasured.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_VERSION:=184c89538aa872faf67ae65d105cb02988c2f883
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=Jernej Kos <jernej@kos.mx>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/netmeasured
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Network measurement daemon
  DEPENDS:=+libuci +libubus +libubox
endef

define Package/netmeasured/description
  Network measurement daemon
endef

define Package/netmeasured/conffiles
/etc/config/netmeasured
endef

define Package/netmeasured/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/netmeasured.init $(1)/etc/init.d/netmeasured
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/netmeasured $(1)/usr/bin/netmeasured
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/netmeasured.config $(1)/etc/config/netmeasured
endef

$(eval $(call BuildPackage,netmeasured))

