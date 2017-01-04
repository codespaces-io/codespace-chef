#!/bin/bash

/etc/init.d/ssh start
/etc/init.d/ssh stop
/usr/sbin/sshd -D
~                 
