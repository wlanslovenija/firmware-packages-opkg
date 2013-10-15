include $(TOPDIR)/rules.mk

PKG_NAME:=keycfg
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/keycfg
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+dropbear
  TITLE:=Manage SSH keys via UCI
  URL:=
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/cronscripts/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/keycfg.init $(1)/etc/init.d/keycfg
endef

$(eval $(call BuildPackage,keycfg))
