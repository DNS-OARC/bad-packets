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
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 1000 2000 128


v4_frag_fuzz_id.pcap: v4_frag_fuzz_id.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 1000 2000 128


v4_frag_fuzz_src.pcap: v4_frag_fuzz_src.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 1000 2000 128


v4_frag_fuzz_dst.pcap: v4_frag_fuzz_dst.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 1000 2000 128


v4_frag_fuzz_proto.pcap: v4_frag_fuzz_proto.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 1000 2000 128


v4_frag_skip_first.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 0

v4_frag_skip_middle.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 4

v4_frag_skip_last.pcap: v4_frag_skip.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 -1


v4_frag_offset_offbyone1.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 3 1

v4_frag_offset_offbyone2.pcap: v4_frag_offset.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 5 -1


v4_frag_empty.pcap: v4_frag_empty.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 2


v4_frag_dup.pcap: v4_frag_dup.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 6


v4_frag_order.pcap: v4_frag_order.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128


v4_frag_nomf.pcap: v4_frag_nomf.py
	PYTHONPATH="$(PWD)/scapy" ./$< $@ 2000 128 10
