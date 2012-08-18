include $(TOPDIR)/rules.mk

PKG_NAME:=policy-routing
PKG_VERSION:=0.1
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/policy-routing
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ip
  TITLE:=Policy routing scripts
  URL:=
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/policy-routing/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/routing.init $(1)/etc/init.d/routing
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/config.default $(1)/etc/config/routing
endef

$(eval $(call BuildPackage,policy-routing))
