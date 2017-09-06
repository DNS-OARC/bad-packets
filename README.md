# bad-packets
Collection of "bad" packets in PCAPs that can be used for testing software

- `v4_frag_dup.pcap`: contains a duplicated fragment
- `v4_frag_empty.pcap`: remove IP payload from one fragment
- `v4_frag_fuzz_dst.pcap`: multiple fragmented packets with destination address fuzzed
- `v4_frag_fuzz_id.pcap`: multiple fragmented packets with IP ID fuzzed
- `v4_frag_fuzz_offset.pcap`: multiple fragmented packets with fragment offset fuzzed
- `v4_frag_fuzz_proto.pcap`: multiple fragmented packets with IP protocol fuzzed
- `v4_frag_fuzz_src.pcap`: multiple fragmented packets with source address fuzzed
- `v4_frag_nomf.pcap`: remove MF (more fragments) flag from one fragment (not last)
- `v4_frag_offset_offbyone1.pcap`: one fragment with offset of by one (+1)
- `v4_frag_offset_offbyone2.pcap`: one fragment with offset of by one (-1)
- `v4_frag_order.pcap`: multiple packets with fragments in asc, desc and random order
- `v4_frag_skip_first.pcap`: a fragmented packet without the first fragment
- `v4_frag_skip_last.pcap`: a fragmented packet without the last fragment
- `v4_frag_skip_middle.pcap`: a fragmented packet without a fragment in the "middle"

## Build

```
git submodule update --init
PYTHONPATH=$PWD/scapy make
```
