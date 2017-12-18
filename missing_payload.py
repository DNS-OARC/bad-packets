#! /usr/bin/env python

import sys
from scapy.all import *

pcap = sys.argv[1]

pkts = []
pkt = IP()/UDP()/("a"*100)
pkt[0].len = 200
pkts.append(pkt)
pkt = IP()/TCP()/("a"*100)
pkt[0].len = 200
pkts.append(pkt)
pkt = IPv6()/UDP()/("a"*100)
pkt[0].plen = 200
pkts.append(pkt)
pkt = IPv6()/TCP()/("a"*100)
pkt[0].plen = 200
pkts.append(pkt)

wrpcap(pcap, pkts)
