#! /usr/bin/env python

import sys,random
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])

ids = {}
ips = 5
ip = []
while ips > 0:
    n = fragment6(IPv6()/IPv6ExtHdrFragment()/UDP()/("a"*pkt_size), fragsize)
    if n[0][1].id in ids:
        continue
    ids[n[0][1].id] = 1
    ip.append(n)
    ips -= 1

pkts = ip[0]
frags = ip[1]
frags.reverse()
pkts += frags
frags = ip[2]
frags += ip[3]
frags += ip[4]
random.shuffle(frags)
pkts += frags

wrpcap(pcap, pkts)
