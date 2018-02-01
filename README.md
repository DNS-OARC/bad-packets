# bad-packets
Collection of "bad" packets in PCAPs that can be used for testing software

- `<ipv>_frag_dup_<proto>.pcap`: contains a duplicated fragment
- `<ipv>_frag_empty_<proto>.pcap`: remove IP payload from one fragment
- `<ipv>_frag_fuzz_dst_<proto>.pcap`: multiple fragmented packets with destination address fuzzed
- `<ipv>_frag_fuzz_id_<proto>.pcap`: multiple fragmented packets with IP ID fuzzed
- `<ipv>_frag_fuzz_offset_<proto>.pcap`: multiple fragmented packets with fragment offset fuzzed
- `<ipv>_frag_fuzz_proto_<proto>.pcap`: multiple fragmented packets with IP protocol fuzzed
- `<ipv>_frag_fuzz_src_<proto>.pcap`: multiple fragmented packets with source address fuzzed
- `<ipv>_frag_nomf_<proto>.pcap`: remove MF (more fragments) flag from one fragment (not last)
- `<ipv>_frag_offset_offbyone1_<proto>.pcap`: one fragment with offset of by one (+1)
- `<ipv>_frag_offset_offbyone2_<proto>.pcap`: one fragment with offset of by one (-1)
- `<ipv>_frag_order_<proto>.pcap`: multiple packets with fragments in asc, desc and random order
- `<ipv>_frag_skip_first_<proto>.pcap`: a fragmented packet without the first fragment
- `<ipv>_frag_skip_last_<proto>.pcap`: a fragmented packet without the last fragment
- `<ipv>_frag_skip_middle_<proto>.pcap`: a fragmented packet without a fragment in the "middle"
- `<ipv>_tcp_opts_tcp.pcap`: a packet with TCP options

Different PCAPs are generated based on IP version and protocol:
- `<ipv>`: `v4` or `v6`
- `<proto>`: `udp` or `tcp`

## Build

```shell
git submodule update --init
make
```

Note: See `Makefile` for various options when generating packets.

## Dependencies

- python

## Static PCAPs

- [various DNS PCAPs](https://github.com/DNS-OARC/bad-packets/various-dns-pcaps)
