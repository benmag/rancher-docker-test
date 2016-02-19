#!/bin/bash
logfile=/var/log/testblog.log
cron
echo "reboot" >> $logfile 
date >> $logfile
tail -f $logfile