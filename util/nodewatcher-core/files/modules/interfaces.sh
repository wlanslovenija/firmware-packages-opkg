#
# nodewatcher module
# NETWORK INTERFACES
#

# Module metadata
MODULE_ID="core.interfaces"
MODULE_SERIAL=2

#
# Report output function
#
report()
{
  IFACES=`cat /proc/net/dev | awk -F: '!/\|/ { gsub(/[[:space:]]*/, "", $1); split($2, a, " "); printf("%s=%s=%s=%s=%s ", $1, a[1], a[9], a[2], a[10]) }'`
  
  # Output entries for each interface
  for entry in $IFACES; do
    iface=`echo $entry | cut -d '=' -f 1`
    rx_bytes=`echo $entry | cut -d '=' -f 2`
    tx_bytes=`echo $entry | cut -d '=' -f 3`
    rx_packets=`echo $entry | cut -d '=' -f 4`
    tx_packets=`echo $entry | cut -d '=' -f 5`
    
    # Check interface metadata
    local iface_meta="$(ip link show ${iface})"
    local iface_mac="`echo $iface_meta | grep -Eo 'link/ether ..:..:..:..:..:..' | cut -d ' ' -f 2`"
    local iface_mtu="`echo $iface_meta | grep -Eo 'mtu [0-9]+' | cut -d ' ' -f 2`"
    
    # Skip all non-ethernet interfaces
    if [[ "$iface_mac" != "" ]]; then
      convert_to_key iface
      show_entry "iface.${iface}.mac" $iface_mac
      show_entry "iface.${iface}.mtu" $iface_mtu
      show_entry "iface.${iface}.tx_bytes" $tx_bytes
      show_entry "iface.${iface}.rx_bytes" $rx_bytes
      show_entry "iface.${iface}.tx_packets" $tx_packets
      show_entry "iface.${iface}.rx_packets" $rx_packets

      # TODO: Remove these legacy entries when monitor is migrated
      show_entry "iface.${iface}.down" $rx_bytes
      show_entry "iface.${iface}.up" $tx_bytes
    fi
  done
}

