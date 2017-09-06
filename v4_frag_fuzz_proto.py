#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
num_pkts = int(sys.argv[2])
pkt_size = int(sys.argv[3])
fragsize = int(sys.argv[4])

pkts = []
while num_pkts > 0:
    frags = fragment(IP()/UDP()/("a"*pkt_size), fragsize=fragsize)
    for p in frags:
        f = fuzz(IP())
        p.proto = f.proto
        pkts.append(p)
    num_pkts -= 1

wrpcap(pcap, pkts)
