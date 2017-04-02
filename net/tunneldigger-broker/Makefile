include $(TOPDIR)/rules.mk

PKG_NAME:=tunneldigger-broker
PKG_VERSION:=0.3.0
PKG_RELEASE:=1
PKG_REV:=235e111fb8fa02c4687af7f695e21204d9d28fe6

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=git://github.com/wlanslovenija/tunneldigger.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=python-cffi/host

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/tunneldigger-broker
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libnl-tiny +kmod-l2tp +kmod-l2tp-ip +kmod-l2tp-eth +kmod-sched +librt +libpthread +python +python-six +libnfnetlink +libnetfilter-conntrack +iptables-mod-conntrack-extra +python-netfilter +ip-full +python-cffi
  TITLE:=tunneldigger-broker
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/broker/* $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="/usr" --root="$(PKG_INSTALL_DIR)")
endef

define PyPackage/tunneldigger-broker/install
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

$(eval $(call PyPackage,tunneldigger-broker))
$(eval $(call BuildPackage,tunneldigger-broker))
