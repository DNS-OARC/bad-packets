#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])
empty = int(sys.argv[4])

tcp = 0
if len(sys.argv) > 5:
    if sys.argv[5] == "tcp":
        tcp = 1

if tcp:
    frags = fragment(IP()/TCP()/("a"*pkt_size), fragsize=fragsize)
else:
    frags = fragment(IP()/UDP()/("a"*pkt_size), fragsize=fragsize)
frags[empty].remove_payload()

wrpcap(pcap, frags)
