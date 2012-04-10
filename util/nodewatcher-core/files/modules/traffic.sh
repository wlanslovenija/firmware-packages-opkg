#
# nodewatcher module
# INTERFACE TRAFFIC STATISTICS
#

# Module metadata
MODULE_ID="core.traffic"
MODULE_SERIAL=1

#
# Report output function
#
report()
{
  IFACES=`cat /proc/net/dev | awk -F: '!/\|/ { gsub(/[[:space:]]*/, "", $1); split($2, a, " "); printf("%s=%s=%s ", $1, a[1], a[9]) }'`
  
  # Output entries for each interface
  for entry in $IFACES; do
    iface=`echo $entry | cut -d '=' -f 1`
    rcv=`echo $entry | cut -d '=' -f 2`
    xmt=`echo $entry | cut -d '=' -f 3`
    
    # Check interface metadata
    local iface_meta="$(ip link show ${iface})"
    local iface_mac="`echo $iface_meta | grep -Eo 'link/ether ..:..:..:..:..:..' | cut -d ' ' -f 2`"
    
    # Skip all non-ethernet interfaces
    if [[ "$iface_mac" != "" ]]; then
      convert_to_key iface
      show_entry "iface.${iface}.mac" $iface_mac
      show_entry "iface.${iface}.down" $rcv
      show_entry "iface.${iface}.up" $xmt
    fi
  done
}

