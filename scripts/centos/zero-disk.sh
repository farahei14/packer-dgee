#!/bin/sh

FileSystem=`grep ext /etc/mtab| awk -F" " '{ print $2 }'`

for i in $FileSystem
do
   echo $i
   number=`df -B 512 $i | awk -F" " '{print $3}' |
   grep -v Used`
   echo $number
   percent=$(echo "scale=0; $number * 99 / 100" | bc )
   echo $percent
   dd count=`echo $percent` if=/dev/zero of=`echo $i`/zf
   sync
   sleep 15
   rm -f $i/zf
done

VolumeGroup=`vgdisplay | grep Name | awk -F" " '{ print $3 }'`
for j in $VolumeGroup
do
   echo $j
   lvcreate -l `vgdisplay $j | grep Free | awk -F" " '{ print $5 }'` -n zero $j
   if [ -a /dev/$j/zero ]
   then
      cat /dev/zero > /dev/$j/zero
      /bin/sync
      sleep 15
      lvremove -f /dev/$j/zero
   fi
done
