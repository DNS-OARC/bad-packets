#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]

pkts = []
pkt = IP()/UDP()/("a"*200)
pkt[0].len = 100
pkts.append(pkt)
pkt = IP()/TCP()/("a"*200)
pkt[0].len = 100
pkts.append(pkt)
pkt = IPv6()/UDP()/("a"*200)
pkt[0].plen = 100
pkts.append(pkt)
pkt = IPv6()/TCP()/("a"*200)
pkt[0].plen = 100
pkts.append(pkt)

wrpcap(pcap, pkts)
