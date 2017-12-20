#! /usr/bin/env python

import sys
from scapy.all import *

inpcap = sys.argv[1]
outpcap = sys.argv[2]
vlan = sys.argv[3]

pkts = []
for p in rdpcap(inpcap):
    l = p.firstlayer()
    while not isinstance(l, NoPayload):
        if 'chksum' in l.default_fields:
            del l.chksum
        if (type(l) is Ether):
            l.type = 33024
            dot1q = Dot1Q(vlan=int(vlan))
            dot1q.add_payload(l.payload)
            l.remove_payload()
            l.add_payload(dot1q)
            l = dot1q
        l = l.payload
    pkts.append(p)

wrpcap(outpcap, pkts)
