#
# nodewatcher module
# TELEMETRY MODULE
#

# Module metadata
MODULE_ID="core.telemetry"
MODULE_SERIAL=1

#
# Report output function
#
report()
{
  # does any sensor data exist?
  ls /tmp/telemetry.ds18b20.* 1>/dev/null 2>/dev/null
  if [ "$?" == "0" ]; then
    for i in /tmp/telemetry.ds18b20.*; do
      show_entry_from_file "`basename $i`" "$i" "error"
    done
  fi

  f="/tmp/telemetry.ina219.voltage"
  if [ -f "$f" ]; then
    show_entry_from_file "`basename $f`" "$f" "error"
  fi

  ls /tmp/telemetry.csense.* 1>/dev/null 2>/dev/null
  if [ "$?" == "0" ]; then
    for i in /tmp/telemetry.csense.*; do
      show_entry_from_file "`basename $i`" "$i" "error"
    done
  fi
}
