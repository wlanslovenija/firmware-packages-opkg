#
# nodewatcher module
# GENERAL STATISTICS
#

# Module metadata
MODULE_ID="core.general"
MODULE_SERIAL=1

#
# Report output function
#
report()
{
  show_entry_from_file "general.uuid" /etc/uuid "missing"
  show_entry_from_file "general.version" /etc/version "missing"
  show_entry "general.local_time" "`date +%s`"
  show_entry "general.uptime" "`cat /proc/uptime`"
  show_entry "general.loadavg" "`cat /proc/loadavg`"
  
  # Memory
  local memfree="`cat /proc/meminfo | awk '/^MemFree/ { print $2 }'`"
  local buffers="`cat /proc/meminfo | awk '/^Buffers/ { print $2 }'`"
  local cached="`cat /proc/meminfo | awk '/^Cached/ { print $2 }'`"
  
  # TODO These are now deprecated and should be removed in a later
  # version (when the old nodewatcher instance is replaced)
  show_entry "general.memfree" "${memfree}"
  show_entry "general.buffers" "${buffers}"
  show_entry "general.cached" "${cached}"
  
  show_entry "general.memory.free" "${memfree}"
  show_entry "general.memory.buffers" "${buffers}"
  show_entry "general.memory.cache" "${cached}"
}

