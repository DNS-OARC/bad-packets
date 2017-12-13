#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])
frag = int(sys.argv[4])
offset = int(sys.argv[5])

tcp = 0
if len(sys.argv) > 6:
    if sys.argv[6] == "tcp":
        tcp = 1

if tcp:
    frags = fragment(IP()/TCP()/("a"*pkt_size), fragsize=fragsize)
else:
    frags = fragment(IP()/UDP()/("a"*pkt_size), fragsize=fragsize)
frags[frag].frag += offset

wrpcap(pcap, frags)
