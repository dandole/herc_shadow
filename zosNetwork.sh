#!/bin/bash
echo "1"  > /proc/sys/net/ipv4/conf/all/proxy_arp
echo "1"  > /proc/sys/net/ipv4/conf/all/forwarding
