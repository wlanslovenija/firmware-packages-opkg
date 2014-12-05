include $(TOPDIR)/rules.mk

PKG_NAME:=maccfg
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/maccfg
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=
  TITLE:=Setup MAC addresses from flash
  URL:=
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/maccfg/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/maccfg.init $(1)/etc/init.d/maccfg
endef

$(eval $(call BuildPackage,maccfg))
