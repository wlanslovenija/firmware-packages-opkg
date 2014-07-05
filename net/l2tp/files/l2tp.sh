#!/bin/sh

[ -n "$INCLUDE_ONLY" ] || {
	. /lib/functions.sh
	. ../netifd-proto.sh
	init_proto "$@"
}

proto_l2tp_init_config() {
	no_device=1
	available=1

	proto_config_add_string 'localaddr:ipaddr'
	proto_config_add_string 'peeraddr:ipaddr'
	proto_config_add_string 'encap:or("udp","ip")'
	proto_config_add_int sport
	proto_config_add_int dport
	proto_config_add_int tunnel_id
	proto_config_add_int peer_tunnel_id
	proto_config_add_int session_id
	proto_config_add_int peer_session_id 
}

proto_l2tp_setup() {
	local interface="$1"

	local localaddr peeraddr encap sport dport tunnel_id peer_tunnel_id session_id peer_session_id
	json_get_vars localaddr peeraddr encap sport dport tunnel_id peer_tunnel_id session_id peer_session_id

	case "$encap" in
		udp)
			if [[ -z "${sport}" || -z "${dport}" ]]; then
				proto_notify_error "$interface" "MISSING_PORTS"
				proto_block_restart "$interface"
				return
			fi

			sport="udp_sport ${sport}"
			dport="udp_dport ${dport}"
		;;
		*)
			encap="ip"
			sport=""
			dport=""
		;;
	esac

	if [[ -z "${peeraddr}" || -z "${localaddr}" ]]; then
		proto_notify_error "$interface" "MISSING_ADDRESS"
		proto_block_restart "$interface"
		return
	elif [[ -z "${tunnel_id}" || -z "${peer_tunnel_id}" ]]; then
		proto_notify_error "$interface" "MISSING_TUNNEL_ID"
		proto_block_restart "$interface"
		return
	elif [[ -z "${session_id}" || -z "${peer_session_id}" ]]; then
		proto_notify_error "$interface" "MISSING_SESSION_ID"
		proto_block_restart "$interface"
		return
	fi

	( proto_add_host_dependency "$interface" "${localaddr}" )

	ip l2tp add tunnel \
		remote ${peeraddr} \
		local ${localaddr} \
		tunnel_id ${tunnel_id} \
		peer_tunnel_id ${peer_tunnel_id} \
		encap ${encap} \
		${sport} \
		${dport} || {
		proto_notify_error "$interface" "NO_LOCAL_ADDRESS"
		return
	}

	ip l2tp add session \
		name ${interface} \
		tunnel_id ${tunnel_id} \
		session_id ${session_id} \
		peer_session_id ${peer_session_id}

	ip link set dev ${interface} up

	# Signal that the interface is up
	proto_init_update "$interface" 1
	proto_send_update "$interface"
}

proto_l2tp_teardown() {
	local interface="$1"

	local tunnel_id
	json_get_vars tunnel_id

	ip link set dev ${interface} down
	ip l2tp del tunnel tunnel_id ${tunnel_id}

	# Signal that the interface is down
	proto_init_update "$interface" 0
	proto_send_update "$interface"
}

[ -n "$INCLUDE_ONLY" ] || {
	add_protocol l2tp
}

