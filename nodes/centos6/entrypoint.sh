#!/bin/bash

/etc/init.d/sshd start
/etc/init.d/sshd stop
/usr/sbin/sshd -D
