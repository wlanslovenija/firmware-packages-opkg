BEGIN {
  frequency=""
  noise=""
  active=""
  busy=""
  rcv=""
  xmit=""
}

{
  if ($1 == "frequency:" && $0 ~ /in use/) {
    frequency=$2
  } else if (frequency != "") {
    if ($1 == "noise:") {
      noise=$2
    } else if ($1 == "channel" && $2 == "active") {
      active=$4
    } else if ($1 == "channel" && $2 == "busy") {
      busy=$4
    } else if ($1 == "channel" && $2 == "receive") {
      rcv=$4
    } else if ($1 == "channel" && $2 == "transmit") {
      xmit=$4
      exit
    }
  }
}

END {
  printf("wireless.survey.%s.frequency: %s\n", iface, frequency)
  printf("wireless.survey.%s.noise: %s\n", iface, noise)
  printf("wireless.survey.%s.active: %s\n", iface, active)
  printf("wireless.survey.%s.busy: %s\n", iface, busy)
  printf("wireless.survey.%s.rcv: %s\n", iface, rcv)
  printf("wireless.survey.%s.xmit: %s\n", iface, xmit)
}
