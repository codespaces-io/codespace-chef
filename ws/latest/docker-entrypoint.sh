#!/bin/bash 
 
    echo 172.0.101.10 node1 >> /etc/hosts
    echo 172.0.101.11 node2 >> /etc/hosts
    echo 172.0.101.12 node3 >> /etc/hosts
    echo 172.0.101.13 node4 >> /etc/hosts


exec "$@"

