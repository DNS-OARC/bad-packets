#! /usr/bin/env python

import sys,random
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])

tcp = 0
if len(sys.argv) > 4:
    if sys.argv[4] == "tcp":
        tcp = 1

if tcp:
    pkts = fragment(IP()/TCP()/("a"*pkt_size), fragsize=fragsize)
    frags = fragment(IP(id=2)/TCP()/("a"*pkt_size), fragsize=fragsize)
    frags.reverse()
    pkts += frags
    frags = fragment(IP(id=3)/TCP()/("a"*pkt_size), fragsize=fragsize)
    frags += fragment(IP(id=4)/TCP()/("a"*pkt_size), fragsize=fragsize)
    frags += fragment(IP(id=5)/TCP()/("a"*pkt_size), fragsize=fragsize)
else:
    pkts = fragment(IP()/UDP()/("a"*pkt_size), fragsize=fragsize)
    frags = fragment(IP(id=2)/UDP()/("a"*pkt_size), fragsize=fragsize)
    frags.reverse()
    pkts += frags
    frags = fragment(IP(id=3)/UDP()/("a"*pkt_size), fragsize=fragsize)
    frags += fragment(IP(id=4)/UDP()/("a"*pkt_size), fragsize=fragsize)
    frags += fragment(IP(id=5)/UDP()/("a"*pkt_size), fragsize=fragsize)
random.shuffle(frags)
pkts += frags

wrpcap(pcap, pkts)
