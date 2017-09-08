#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])
fragsize = int(sys.argv[3])
frag = int(sys.argv[4])
offset = int(sys.argv[5])

frags = fragment6(IPv6()/IPv6ExtHdrFragment()/UDP()/("a"*pkt_size), fragsize)
frags[frag][1].offset += offset

wrpcap(pcap, frags)
