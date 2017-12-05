#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])
timeout_sec = int(sys.argv[4])

frags = fragment(IP()/UDP()/("a"*pkt_size), fragsize=fragsize)
frags[-1].time += timeout_sec

wrpcap(pcap, frags)
