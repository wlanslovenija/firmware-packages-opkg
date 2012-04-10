#
# nodewatcher module
# VPN MODULE
#

# Module metadata
MODULE_ID="core.vpn"
MODULE_SERIAL=1

#
# VPN device name detection
#
check_vpn_device()
{
  local test_devices="$@"
  for test_device in $test_devices; do
    ip link sh dev ${test_device} >/dev/null 2>/dev/null
    if [ "$?" == "0" ]; then
      VPN_DEVICE="${test_device}"
      return
    fi
  done
}

#
# Report output function
#
report()
{
  # Detect the correct VPN device
  check_vpn_device tap0 tap1 edge0 edge1

  # Output VPN information
  show_entry "net.vpn.upload_limit" "`tc qdisc show dev ${VPN_DEVICE} 2>/dev/null | grep -Eo '[0-9]+.?bit'`"
  show_entry "net.vpn.mac" "`ip link show dev ${VPN_DEVICE} 2>/dev/null | tail -n 1 | awk '{ print $2 }'`"
}

