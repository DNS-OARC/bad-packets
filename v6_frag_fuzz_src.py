#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
num_pkts = int(sys.argv[2])
pkt_size = int(sys.argv[3])
fragsize = int(sys.argv[4])

tcp = 0
if len(sys.argv) > 5:
    if sys.argv[5] == "tcp":
        tcp = 1

pkts = []
while num_pkts > 0:
    if tcp:
        frags = fragment6(IPv6()/IPv6ExtHdrFragment()/TCP()/("a"*pkt_size), fragsize)
    else:
        frags = fragment6(IPv6()/IPv6ExtHdrFragment()/UDP()/("a"*pkt_size), fragsize)
    for p in frags:
        p.src = RandIP6()
        pkts.append(p)
    num_pkts -= 1

wrpcap(pcap, pkts)
