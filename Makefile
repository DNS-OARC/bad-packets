NUM_PKTS := 1000
FRAG_PKT_SIZE := 2000
FRAG_SIZE := 128
FRAG_SKIP_MIDDLE := 4
FRAG_OFFBYONE_PLUS := 3
FRAG_OFFBYONE_MINUS := 5
FRAG_EMPTY := 2
FRAG_DUP := 6
FRAG_NOMF := 10

PCAPS = v4_frag_fuzz_offset.pcap
PCAPS += v4_frag_fuzz_id.pcap
PCAPS += v4_frag_fuzz_src.pcap
PCAPS += v4_frag_fuzz_dst.pcap
PCAPS += v4_frag_fuzz_proto.pcap
PCAPS += v4_frag_skip_first.pcap v4_frag_skip_middle.pcap v4_frag_skip_last.pcap
PCAPS += v4_frag_offset_offbyone1.pcap v4_frag_offset_offbyone2.pcap
PCAPS += v4_frag_empty.pcap
PCAPS += v4_frag_dup.pcap
PCAPS += v4_frag_order.pcap
PCAPS += v4_frag_nomf.pcap

all: $(PCAPS)

clean:
	rm -f $(PCAPS)


v4_frag_fuzz_offset.pcap: v4_frag_fuzz_offset.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_id.pcap: v4_frag_fuzz_id.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_src.pcap: v4_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_dst.pcap: v4_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_fuzz_proto.pcap: v4_frag_fuzz_proto.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(NUM_PKTS) $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_skip_first.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) 0

v4_frag_skip_middle.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_SKIP_MIDDLE)

v4_frag_skip_last.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) -1


v4_frag_offset_offbyone1.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_PLUS) 1

v4_frag_offset_offbyone2.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_OFFBYONE_MINUS) -1


v4_frag_empty.pcap: v4_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_EMPTY)


v4_frag_dup.pcap: v4_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_DUP)


v4_frag_order.pcap: v4_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE)


v4_frag_nomf.pcap: v4_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ $(FRAG_PKT_SIZE) $(FRAG_SIZE) $(FRAG_NOMF)
