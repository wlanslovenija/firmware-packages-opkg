include $(TOPDIR)/rules.mk

PKG_NAME:=l2tp
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_MAINTAINER:=Jernej Kos <jernej@kos.mx>

include $(INCLUDE_DIR)/package.mk

define Package/l2tp
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+ip-full +kmod-l2tp +kmod-l2tp-ip +kmod-l2tp-eth
  TITLE:=L2TPv3 configuration support
  MAINTAINER:=$(PKG_MAINTAINER)
  PKGARCH:=all
endef

define Package/l2tp/description
Provides support for L2TPv3 tunnels in /etc/config/network.
endef

define Build/Compile
endef

define Build/Configure
endef

define Package/l2tp/install
	$(INSTALL_DIR) $(1)/lib/netifd/proto
	$(INSTALL_BIN) ./files/l2tp.sh $(1)/lib/netifd/proto
endef

$(eval $(call BuildPackage,l2tp))
