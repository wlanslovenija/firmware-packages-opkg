#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=python-repoze-lru
PKG_VERSION:=0.6
PKG_RELEASE:=1

PKG_SOURCE:=repoze.lru-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/r/repoze.lru/
PKG_MD5SUM:=2c3b64b17a8e18b405f55d46173e14dd

PKG_BUILD_DIR:=$(BUILD_DIR)/repoze.lru-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-repoze-lru
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-repoze-lru
  DEPENDS:=+python
endef

define Package/python-repoze-lru/description
  A tiny LRU cache implementation and decorator
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
		install --root="$(PKG_INSTALL_DIR)" --prefix="/usr" \
		--single-version-externally-managed \
	)
endef

define Package/python-repoze-lru/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-repoze-lru))
