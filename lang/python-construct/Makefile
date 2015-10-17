#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=python-construct
PKG_VERSION:=2.5.2
PKG_RELEASE:=1

PKG_SOURCE:=construct-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/c/construct/
PKG_MD5SUM:=75fc5e311ee5624e63268067e4b0d97b

PKG_BUILD_DIR:=$(BUILD_DIR)/construct-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-construct
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-construct
  DEPENDS:=+python
endef

define Package/python-construct/description
  A powerful declarative parser/builder for binary data
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/python-construct/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-construct))
