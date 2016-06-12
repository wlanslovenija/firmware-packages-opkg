nodewatcher opkg packages
=========================

This repository contains opkg packages used in the default `nodewatcher firmware`_.
Opkg packages are used by OpenWrt and you can include all these package
as an `OpenWrt feed`_ into your firmware to get access to them.

Some packages which are available are for the following software:

* `nodewatcher-agent`_ – a monitoring agent for *nodewatcher*
* `tunneldigger`_ – both client and broker
* nodeupgrade – a program to flash devices with new version of *nodewatcher* firmware

To add the feed to your OpenWrt firmware, add ``https://github.com/wlanslovenija/firmware-packages-opkg.git`` to
your firmware's ``feeds.conf`` and run ``./scripts/feeds update -a``.

.. _nodewatcher firmware: https://github.com/wlanslovenija/firmware-core
.. _OpenWrt feed: https://wiki.openwrt.org/doc/devel/feeds
.. _nodewatcher-agent: https://github.com/wlanslovenija/nodewatcher-agent
.. _tunneldigger: https://github.com/wlanslovenija/tunneldigger

Source Code, Issue Tracker and Mailing List
-------------------------------------------

For development *wlan slovenija* open wireless network `development Trac`_ is
used, so you can see `existing open tickets`_ or `open a new one`_ there. Source
code is available on GitHub_. If you have any questions or if you want to
discuss the project, use `development mailing list`_.

.. _development Trac: https://dev.wlan-si.net/
.. _existing open tickets: https://dev.wlan-si.net/report
.. _open a new one: https://dev.wlan-si.net/newticket
.. _GitHub: https://github.com/wlanslovenija/firmware-packages-opkg
.. _development mailing list: https://wlan-si.net/lists/info/development
