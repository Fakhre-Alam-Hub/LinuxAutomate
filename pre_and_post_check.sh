#!/bin/bash
#Author: ALAM
#Date: 04-05-2024

#Variables to declare
LOGDIR="/var/tmp/idclogs" 
DAY=$(date +%Y%m%d)
HOST=$(hostname) 
colorreset=$(tput sgr0)
PATH=/usr/bin:/usr/sbin:/bin:/sbin:/opt/VRTSvcs/bin:/opt/VRTS
#release=$(grep -oE '[0-9]+\.[0-9]+'/etc/redhat-release) 
releasename=$(uname -s) 
if [ ! -d "$LOGDIR" ]
then
mkdir -p "$LOGDIR" &>/dev/null
fi
cd /var/tmp/idclogs/
if [ ! -d "$HOST" ]
then
mkdir -p "$HOST" &>/dev/null
fi

#Pre check function to declare this will run all basic information commands
#and save that to precheck folder ## trap ctrl-c to terminate script
dmidecode | grep -i "Product Name" | tee /var/tmp/idclogs/$HOST/product-$(date + %Y%m%d)
dmidecode | grep "Serial Number" | tee /var/tmp/idclogs/$HOST/serial-$(date +%Y%m%d) 
cat /etc/issue | tee /var/tmp/idclogs/$HOST/issue-$(date +%Y%m%d)
cat /etc/grub.conf | tee /var/tmp/idclogs/$HOST/grub-$(date +%Y%m%d)
cat /proc/version | tee /var/tmp/idclogs/$HOST/version-$(date +%Y%m%d)
hostid | tee /var/tmp/idclogs/$HOST/hostid-$(date +%Y%m%d) 
uname -n | tee /var/tmp/idclogs/ $HOST/uname_n-$(date +%Y%m%d)
ifconfig -a | tee /var/tmp/idclogs/$HOST/ifconfig-$(date +%Y%m%d)
cat /etc/sysconfig/network-scripts/ifcfg-eth* | tee /var/tmp/idclogs/$HOST/eth-$(date +%Y%m%d)
cat /etc/sysconfig/network-scripts/ifcfg-bond* | tee/var/tmp/idclogs/$HOST/bond-$(date +%Y%m%d)
cat /etc/sysconfig/network | tee /var/tmp/idclogs/$HOST/network-$(date +%Y%m%d)
cat /etc/protocols | tee /var/tmp/idclogs/$HOST/protocols-$(date +%Y%m%d)
ip link show | tee /var/tmp/idclogs/$HOST/iplink-$(date +%Y%m%d)
ip addr show | tee /var/tmp/idclogs/$HOST/ipadd-$(date +%Y%m%d)
route -n | tee /var/tmp/idclogs/$HOST/route-$(date +%Y%m%d) 
ip route show | tee /var/tmp/idclogs/$HOST/iproute-$(date +%Y%m%d)
ls -lrt /dev/cciss | tee /var/tmp/idclogs/$HOST/cciss-$(date +%Y%m%d)
fdisk -l | tee /var/tmp/idclogs/SHOST/fdisk-$(date +%Y%m%d) 
netstat -tulpn | tee /var/tmp/idclogs/$HOST/netstat-$(date +%Y%m%d)
cat /etc/fstab | tee /var/tmp/idclogs/$HOST/fstab-$(date +%Y%m%d)
cat /etc/mtab | tee /var/tmp/idclogs/$HOST/mtab-$(date +%Y%m%d)
cat /etc/mdstatstatus | tee /var/tmp/idclogs/$HOST/mdstatus-$(date +%Y%m%d)
df -k;df -h | tee /var/tmp/idclogs/SHOST/df-$(date +%Y%m%)
swapon -s | tee /var/tmp/idclogs/$HOST/swap-$(date +%Y%m%d)
uname -a | tee /var/tmp/idclogs/$HOST/uname-$(date +%Y%m%d) 
cat /etc/hosts | tee /var/tmp/idclogs/$HOST/hosts-$(date +%Y%m%d)
cat /etc/passwd | tee /var/tmp/idclogs/$HOST/passwd-$(date +%Y%m%d)
cat /etc/shadow | tee /var/tmp/idclogs/$HOST/shadow-$(date +%Y%m%d)
cat /etc/group | tee /var/tmp/idclogs/$HOST/group-$(date +%Y%m%d)
cat /etc/resolv.conf | tee /var/tmp/idclogs/$HOST/resolv-$(date +%Y%m%d)
ls -lrt /home | tee /var/tmp/idclogs/$HOST/home-$(date +%Y%m%d)
cat /etc/exports | tee /var/tmp/idclogs/$HOST/export-$(date +%Y%m%d)
cat /proc/sys/fs/file-max | tee /var/tmp/idclogs/$HOST/filemax-$(date +%Y%m%d) 
cat /etc/crontab | tee /var/tmp/idclogs/$HOST/crontab-$(date +%Y%m%d)
cat /etc/dumpdates | tee /var/tmp/idclogs/$HOST/dump-$(date +%Y%m%d)
cat /etc/redhat-release | tee /var/tmp/idclogs/$HOST/redhatrelease-$(date +%Y%m%d) 
cat /etc/ntp.conf | tee /var/tmp/idclogs/$HOST/ntp-$(date +%Y%m%d)
showmount -e | tee /var/tmp/idclogs/$HOST/showmount-$(date +%Y%m%d)
cat /proc/mounts | tee /var/tmp/idclogs/$HOST/mount-$(date +%Y%m%d)
/sbin/pvdisplay | tee /var/tmp/idclogs/$HOST/pv-$(date +%Y%m%d)
/sbin/pvs | tee /var/tmp/idclogs/$HOST/pvs-$(date +%Y%m%d) 
/sbin/vgdisplay | tee /var/tmp/idclogs/$HOST/vg-$(date +%Y%m%d)
/sbin/vgs | tee /var/tmp/idclogs/$HOST/vgs-$(date +%Y%m%d) 
ulimit -a | tee /var/tmp/idclogs/$HOST/ulimit-$(date +%Y%m%d)
/sbin/lvdisplay | tee /var/tmp/idclogs/$HOST/lv-$(date +%Y%m%d)
/sbin/lvs | tee /var/tmp/idclogs/$HOST/Ivs-$(date +%Y%m%d) 
ntpq -p | tee /var/tmp/idclogs/$HOST/ntpq-$(date +%Y%m%d) 
iostat | tee /var/tmp/idclogs/$HOST/iostat-$(date +%Y%m%d) 
cat/boot/grub/grub.conf | tee /var/tmp/idclogs/$HOST/grub-$(date +%Y%m%d)
ps -ef | grep vx | tee /var/tmp/idclogs/$HOST/vx-$(date +%Y%m%d)
vxdg list | tee /var/tmp/idclogs/$HOST/vxdg-$(date +%Y%m%d)
echo "=============vxprint -ht========="
vxprint -ht | tee /var/tmp/idclogs/$HOST/vxprint-$(date +%Y%m%d)
echo "=============vxprint -vt===="
vxprint -vt | tee /var/tmp/idclogs/$HOST/vxprintvt-$(date +%Y%m%d)
echo "===hastatus==="
hastatus -sum | tee /var/tmp/idclogs/$HOST/vcsstatus-$(date +%Y%m%d)
echo "===vxprint-qhtrg==="
vxprint -qhtrg DGName | tee/var/tmp/idclogs/$HOST/vxprint_ghtrg-$(date +%Y%m%d)
vgdisplay -v | tee /var/tmp/idclogs/$HOST/vgdisplay_v-$(date +%Y%m%d)
/sbin/runlevel | tee /var/tmp/idclogs/$HOST/runlevel-$(date +%Y%m%d)
crontab -l | tee /var/tmp/idclogs/$HOST/crontablist-$(date +%Y%m%d)
cat /proc/driver/cciss/cciss0 | tee /var/tmp/idclogs/$HOST/cciss0-$(date +%Y%m%d)
rpm -q -a --qf'%10{SIZE}\t%{NAME}\n' | sort -k1,1n | tee /var/tmp/idclogs/$HOST/rpm-$(date +$%Y%m%d)
fdisk -l | grep emcpower* | wc -l tee/var/tmp/idclogs/$HOST/emcdevicelist-$(date +%Y%%m%d)
fdisk -1 2>/dev/null | egrep '^Disk' | egrep -v 'dm-' | wc -l | tee /var/tmp/idclogs/$HOST/totaldisk-$(date +%Y%m%d)
echo "=====Host Bus Adapter===="
ls /sys/class/fc_host | tee /var/tmp/idclogs/$HOST/fchost-$(date +%Y%m%d)
ls /sys/class/scsi_host/host | tee /var/tmp/idclogs/$HOST/scsihost-$(date +%Y%m%) 
systemctl get-default | tee/var/tmp/idclogs/$HOST/systemctl_default-$(date + %Y%m%d)
lvscan | tee /var/tmp/idclogs/$HOST/lvscan-$(date +%Y %m%d) 
vgscan | tee /var/tmp/idclogs/$HOST/vgscan-$(date +%Y%m%d)
pvscan | tee /var/tmp/idclogs/$HOST/pvscan-$(date + %Y%m%d)
Isblk | tee /var/tmp/idclogs/$HOST/lsblk-$(date +%Y%m%d) 
blkid | tee /var/tmp/idclogs/$HOST/blkid-$(date +%Y%m%d) 
lsscsi | tee /var/tmp/idclogs/$HOST/lsscsi-$(date +%Y%m%d) 
multipath -ll | grep dm- | tee /var/tmp/idclogs/$HOST/multipath-$(date +%Y%m%d)
tar -cvf $HOST.tar $HOST
