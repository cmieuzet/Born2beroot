#!/bin/bash

nb_lvm=$(lsblk | grep lvm | wc -l)

wall "
#architecture : $(uname -a)
#CPU physical : $(cat /proc/cpuinfo | grep "physical id" | uniq | wc -l)
#vCPU : $(cat /proc/cpuinfo | grep processor | wc -l)
#Memory Usage : $(free -m | grep Mem | awk '{printf "%d/%dMB (%.1f%%)", $3, $2, ($3*100)/$2}')
#Disk Usage : $(df -h | grep home | awk '{printf "%d/%dGb (%.1f%%)", $3, $4, $5}')
#CPU load : $(top -bn1 | grep "%Cpu" | awk '{printf "%s%%", $4}')
#Last boot : $(who -b | cut -c 23-38)
#LVM use : $(if [ $nb_lvm > "0" ]; then echo yes; else echo no; fi)
#Connexions TCP : $(netstat | grep ESTABLISHED | wc -l) ESTABLISHED
#User log : $(who | cut -d " " -f 1 | uniq | wc -l)
#Network : IP $(hostname -I)($(ip link show | grep link/ether | cut -c 16-32))
#Sudo : $(grep COMMAND /var/log/sudo/sudo.log | wc -l) cmd
"
