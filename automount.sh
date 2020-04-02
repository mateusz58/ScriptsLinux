automount() {
ntfs-3g /dev/sda3 /media/sdb1
}

swap() {
umount /dev/sdb1
mkswap /dev/sdb1
swapon -p 30000 /dev/sdb1
}



automount 
swap