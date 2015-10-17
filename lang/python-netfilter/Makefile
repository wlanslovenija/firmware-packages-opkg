#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=python-netfilter
PKG_VERSION:=0.6.2
PKG_RELEASE:=1

PKG_SOURCE:=netfilter-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/n/netfilter/
PKG_MD5SUM:=dc133fba329ba2862828c16a070d509e

PKG_BUILD_DIR:=$(BUILD_DIR)/netfilter-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-netfilter
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-netfilter
  DEPENDS:=+python +python-setuptools
endef

define Package/python-netfilter/description
  Python modules for manipulating netfilter rules
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
		--single-version-externally-managed \
	)
endef

define Package/python-netfilter/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-netfilter))
