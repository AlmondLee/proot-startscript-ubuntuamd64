#!/bin/bash
cd $(dirname $0)
unset LD_PRELOAD
##Assuming that proot is aloneside the proot binary file.
command="./proot"
##The following will cause dpkg problem strangely. I don't know why, so I comment it out.
#command+=" --link2symlink"
##Assuming that ubuntu rootfs is extracted into ./ubuntu
command+=" -S ubuntu"
command+=' -b /sys'
command+=' -b /dev'
command+=' -b /proc'
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
if [ -z "$1" ];then
    exec $command
else
    $command -c "$com"
fi
