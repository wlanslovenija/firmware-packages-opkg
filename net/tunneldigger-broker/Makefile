include $(TOPDIR)/rules.mk

PKG_NAME:=tunneldigger-broker
PKG_VERSION:=0.1.1
PKG_RELEASE:=1
PKG_REV:=89f991fe0922cac4c1dfcafb436117acf43162ba

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/wlanslovenija/tunneldigger.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

include $(INCLUDE_DIR)/package.mk

define Package/tunneldigger-broker
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnl-tiny +kmod-l2tp +kmod-l2tp-ip +kmod-l2tp-eth +librt +libpthread +python +python-six +python-gevent +python-greenlet +libnfnetlink +libnetfilter-conntrack +iptables-mod-conntrack-extra +python-construct +python-netfilter +python-repoze-lru +ip-full
  TITLE:=tunneldigger-broker
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/broker/* $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tunneldigger-broker/install
	$(INSTALL_DIR) $(1)/usr/lib/tunneldigger-broker
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/*.py $(1)/usr/lib/tunneldigger-broker
	$(INSTALL_DIR) $(1)/lib/functions
	$(INSTALL_DATA) ./files/tunneldigger.sh $(1)/lib/functions/tunneldigger.sh
	$(INSTALL_DIR) $(1)/usr/lib/tunneldigger-broker/hooks
	$(INSTALL_BIN) ./files/hook-setup $(1)/usr/lib/tunneldigger-broker/hooks/setup
	$(INSTALL_BIN) ./files/hook-teardown $(1)/usr/lib/tunneldigger-broker/hooks/teardown
	$(INSTALL_BIN) ./files/hook-mtu-changed $(1)/usr/lib/tunneldigger-broker/hooks/mtu-changed
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tunneldigger-broker.init $(1)/etc/init.d/tunneldigger-broker
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/config.default $(1)/etc/config/tunneldigger-broker
endef

define Package/tunneldigger-broker/conffiles
/etc/config/tunneldigger-broker
endef

$(eval $(call BuildPackage,tunneldigger-broker))
