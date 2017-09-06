#! /usr/bin/env python

import sys,random
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])

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
