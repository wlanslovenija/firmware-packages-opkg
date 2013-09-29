include $(TOPDIR)/rules.mk

PKG_NAME:=nodewatcher-core
PKG_VERSION:=0.4
PKG_RELEASE:=5

include $(INCLUDE_DIR)/package.mk

define Package/nodewatcher-core
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+busybox +cronscripts +tc +ip
  TITLE:=nodewatcher-core
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/nodewatcher-core/install
	# Base files
	$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/nodewatcher $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/opkgwatcher $(1)/www/cgi-bin

	# Sanity checks
	$(INSTALL_DIR) $(1)/etc/crontabs/run.5
	$(INSTALL_BIN) ./files/count_wifi_errors $(1)/etc/crontabs/run.5/03-count_wifi_errors
	
	# Common functions
	$(INSTALL_DIR) $(1)/lib/nodewatcher
	$(INSTALL_DATA) ./files/nodewatcher_common.sh $(1)/lib/nodewatcher/common.sh
	
	# Modules
	$(INSTALL_DIR) $(1)/etc/nodewatcher.d
	$(INSTALL_DATA) ./files/modules/general.sh $(1)/etc/nodewatcher.d/general.sh
	$(INSTALL_DATA) ./files/modules/wireless.sh $(1)/etc/nodewatcher.d/wireless.sh
	$(INSTALL_DATA) ./files/modules/interfaces.sh $(1)/etc/nodewatcher.d/interfaces.sh
endef

$(eval $(call BuildPackage,nodewatcher-core))
