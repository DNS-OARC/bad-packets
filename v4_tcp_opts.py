#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]
pkt_size = int(sys.argv[2])

pkt = IP()/TCP(options=[("NOP", None), (19, "\xff\xff\xff\xff\xff\xff")])/("a"*pkt_size)

wrpcap(pcap, pkt)
