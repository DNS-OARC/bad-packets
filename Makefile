DESTDIR := .

NUM_PKTS := 1000
FRAG_PKT_SIZE := 2000
FRAG_SIZE := 128
FRAG_SKIP_MIDDLE := 4
FRAG_OFFBYONE_PLUS := 3
FRAG_OFFBYONE_MINUS := 5
FRAG_EMPTY := 2
FRAG_DUP := 6
FRAG_NOMF := 10
FRAG_TIMEOUT := 100

PCAPS = v4_frag_fuzz_offset_udp.pcap
PCAPS += v4_frag_fuzz_id_udp.pcap
PCAPS += v4_frag_fuzz_src_udp.pcap
PCAPS += v4_frag_fuzz_dst_udp.pcap
PCAPS += v4_frag_fuzz_proto_udp.pcap
PCAPS += v4_frag_skip_first_udp.pcap v4_frag_skip_middle_udp.pcap v4_frag_skip_last_udp.pcap
PCAPS += v4_frag_offset_offbyone1_udp.pcap v4_frag_offset_offbyone2_udp.pcap
PCAPS += v4_frag_empty_udp.pcap
PCAPS += v4_frag_dup_udp.pcap
PCAPS += v4_frag_order_udp.pcap
PCAPS += v4_frag_nomf_udp.pcap
PCAPS += v6_frag_fuzz_offset_udp.pcap
PCAPS += v6_frag_fuzz_src_udp.pcap
PCAPS += v6_frag_fuzz_dst_udp.pcap
PCAPS += v6_frag_skip_first_udp.pcap v6_frag_skip_middle_udp.pcap v6_frag_skip_last_udp.pcap
PCAPS += v6_frag_offset_offbyone1_udp.pcap v6_frag_offset_offbyone2_udp.pcap
PCAPS += v6_frag_empty_udp.pcap
PCAPS += v6_frag_dup_udp.pcap
PCAPS += v6_frag_order_udp.pcap
PCAPS += v6_frag_nomf_udp.pcap
PCAPS += v4_frag_timeout_udp.pcap v6_frag_timeout_udp.pcap

PCAPS += v4_frag_fuzz_offset_tcp.pcap
PCAPS += v4_frag_fuzz_id_tcp.pcap
PCAPS += v4_frag_fuzz_src_tcp.pcap
PCAPS += v4_frag_fuzz_dst_tcp.pcap
PCAPS += v4_frag_fuzz_proto_tcp.pcap
PCAPS += v4_frag_skip_first_tcp.pcap v4_frag_skip_middle_tcp.pcap v4_frag_skip_last_tcp.pcap
PCAPS += v4_frag_offset_offbyone1_tcp.pcap v4_frag_offset_offbyone2_tcp.pcap
PCAPS += v4_frag_empty_tcp.pcap
PCAPS += v4_frag_dup_tcp.pcap
PCAPS += v4_frag_order_tcp.pcap
PCAPS += v4_frag_nomf_tcp.pcap
PCAPS += v6_frag_fuzz_offset_tcp.pcap
PCAPS += v6_frag_fuzz_src_tcp.pcap
PCAPS += v6_frag_fuzz_dst_tcp.pcap
PCAPS += v6_frag_skip_first_tcp.pcap v6_frag_skip_middle_tcp.pcap v6_frag_skip_last_tcp.pcap
PCAPS += v6_frag_offset_offbyone1_tcp.pcap v6_frag_offset_offbyone2_tcp.pcap
PCAPS += v6_frag_empty_tcp.pcap
PCAPS += v6_frag_dup_tcp.pcap
PCAPS += v6_frag_order_tcp.pcap
PCAPS += v6_frag_nomf_tcp.pcap
PCAPS += v4_frag_timeout_tcp.pcap v6_frag_timeout_tcp.pcap

FUZZ_PCAPS = v4_frag_fuzz_offset_udp.pcap
FUZZ_PCAPS += v4_frag_fuzz_id_udp.pcap
FUZZ_PCAPS += v4_frag_fuzz_src_udp.pcap
FUZZ_PCAPS += v4_frag_fuzz_dst_udp.pcap
FUZZ_PCAPS += v4_frag_fuzz_proto_udp.pcap
FUZZ_PCAPS += v6_frag_fuzz_offset_udp.pcap
FUZZ_PCAPS += v6_frag_fuzz_src_udp.pcap
FUZZ_PCAPS += v6_frag_fuzz_dst_udp.pcap

FUZZ_PCAPS += v4_frag_fuzz_offset_tcp.pcap
FUZZ_PCAPS += v4_frag_fuzz_id_tcp.pcap
FUZZ_PCAPS += v4_frag_fuzz_src_tcp.pcap
FUZZ_PCAPS += v4_frag_fuzz_dst_tcp.pcap
FUZZ_PCAPS += v4_frag_fuzz_proto_tcp.pcap
FUZZ_PCAPS += v6_frag_fuzz_offset_tcp.pcap
FUZZ_PCAPS += v6_frag_fuzz_src_tcp.pcap
FUZZ_PCAPS += v6_frag_fuzz_dst_tcp.pcap

PCAPS += v4_tcp_opts_tcp.pcap v6_tcp_opts_tcp.pcap
PCAPS += padding.pcap missing_payload.pcap

all: $(PCAPS)

fuzz: $(FUZZ_PCAPS)

clean:
	rm -f $(PCAPS)


v4_frag_fuzz_offset_udp.pcap: v4_frag_fuzz_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_offset.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_id_udp.pcap: v4_frag_fuzz_id.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_id.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_src_udp.pcap: v4_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_src.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_dst_udp.pcap: v4_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_dst.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_proto_udp.pcap: v4_frag_fuzz_proto.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_proto.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_skip_first_udp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) 0

v4_frag_skip_middle_udp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_SKIP_MIDDLE)

v4_frag_skip_last_udp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) -1


v4_frag_offset_offbyone1_udp.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_PLUS) 1

v4_frag_offset_offbyone2_udp.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_MINUS) -1


v4_frag_empty_udp.pcap: v4_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_empty.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_EMPTY)


v4_frag_dup_udp.pcap: v4_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_dup.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_DUP)


v4_frag_order_udp.pcap: v4_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_order.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_nomf_udp.pcap: v4_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_nomf.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_NOMF)


v6_frag_fuzz_offset_udp.pcap: v6_frag_fuzz_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_offset.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v6_frag_fuzz_src_udp.pcap: v6_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_src.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v6_frag_fuzz_dst_udp.pcap: v6_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_dst.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v6_frag_skip_first_udp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) 0

v6_frag_skip_middle_udp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_SKIP_MIDDLE)

v6_frag_skip_last_udp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) -1


v6_frag_offset_offbyone1_udp.pcap: v6_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_PLUS) 1

v6_frag_offset_offbyone2_udp.pcap: v6_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_MINUS) -1


v6_frag_empty_udp.pcap: v6_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_empty.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_EMPTY)


v6_frag_dup_udp.pcap: v6_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_dup.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_DUP)


v6_frag_order_udp.pcap: v6_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_order.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v6_frag_nomf_udp.pcap: v6_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_nomf.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_NOMF)


v4_frag_timeout_udp.pcap: v4_frag_timeout.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_timeout.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_TIMEOUT)

v6_frag_timeout_udp.pcap: v6_frag_timeout.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_timeout.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_TIMEOUT)


# TCP

v4_frag_fuzz_offset_tcp.pcap: v4_frag_fuzz_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_offset.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_fuzz_id_tcp.pcap: v4_frag_fuzz_id.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_id.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_fuzz_src_tcp.pcap: v4_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_src.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_fuzz_dst_tcp.pcap: v4_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_dst.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_fuzz_proto_tcp.pcap: v4_frag_fuzz_proto.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_fuzz_proto.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_skip_first_tcp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) 0 tcp

v4_frag_skip_middle_tcp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_SKIP_MIDDLE) tcp

v4_frag_skip_last_tcp.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) -1 tcp


v4_frag_offset_offbyone1_tcp.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_PLUS) 1 tcp

v4_frag_offset_offbyone2_tcp.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_MINUS) -1 tcp


v4_frag_empty_tcp.pcap: v4_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_empty.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_EMPTY) tcp


v4_frag_dup_tcp.pcap: v4_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_dup.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_DUP) tcp


v4_frag_order_tcp.pcap: v4_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_order.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v4_frag_nomf_tcp.pcap: v4_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_nomf.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_NOMF) tcp


v6_frag_fuzz_offset_tcp.pcap: v6_frag_fuzz_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_offset.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v6_frag_fuzz_src_tcp.pcap: v6_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_src.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v6_frag_fuzz_dst_tcp.pcap: v6_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_fuzz_dst.py "$(DESTDIR)/$@" $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v6_frag_skip_first_tcp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) 0 tcp

v6_frag_skip_middle_tcp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_SKIP_MIDDLE) tcp

v6_frag_skip_last_tcp.pcap: v6_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_skip.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) -1 tcp


v6_frag_offset_offbyone1_tcp.pcap: v6_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_PLUS) 1 tcp

v6_frag_offset_offbyone2_tcp.pcap: v6_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_offset.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_MINUS) -1 tcp


v6_frag_empty_tcp.pcap: v6_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_empty.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_EMPTY) tcp


v6_frag_dup_tcp.pcap: v6_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_dup.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_DUP) tcp


v6_frag_order_tcp.pcap: v6_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_order.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) tcp


v6_frag_nomf_tcp.pcap: v6_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_nomf.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_NOMF) tcp


v4_frag_timeout_tcp.pcap: v4_frag_timeout.py
	PYTHONPATH="$(PWD)/scapy" ./v4_frag_timeout.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_TIMEOUT) tcp

v6_frag_timeout_tcp.pcap: v6_frag_timeout.py
	PYTHONPATH="$(PWD)/scapy" ./v6_frag_timeout.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_TIMEOUT) tcp


v4_tcp_opts_tcp.pcap: v4_tcp_opts.py
	PYTHONPATH="$(PWD)/scapy" ./v4_tcp_opts.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) tcp

v6_tcp_opts_tcp.pcap: v6_tcp_opts.py
	PYTHONPATH="$(PWD)/scapy" ./v6_tcp_opts.py "$(DESTDIR)/$@" $(FRAG_PKT_SIZE) tcp

padding.pcap: padding.py
	PYTHONPATH="$(PWD)/scapy" ./padding.py "$(DESTDIR)/$@"

missing_payload.pcap: missing_payload.py
	PYTHONPATH="$(PWD)/scapy" ./missing_payload.py "$(DESTDIR)/$@"
