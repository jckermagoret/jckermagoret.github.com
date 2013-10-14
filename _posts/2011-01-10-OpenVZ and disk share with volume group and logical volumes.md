Use case

I have a virtual system with a main host and various virtual machines. I want these virtual machines to have some directories shared with the main host so the backup will be easier.

Solution

I mount a directory on my main host into the virtual machine. To be the more flexible possible, the mounted directory is based on a logical volume I can increase or decrease according to my needs.

Implementation

On your main host, create a logical volume and format it. For example, if you have a volume group called data, you could do this:

lvcreate -L20G -n vz106 data
mkfs.ext3 /dev/data/vz106
This creates a /dev/data/vz106, which corresponds to a 20GB disk, on your system. This new disk can now be mounted on a directory which is inside one of your container:

mount -n --bind /data/vz/106 /var/lib/vz/root/106/data
To make everything automatic during the reboot, you can create corresponding files in your /etc/vz directory. On my system, I have:

/etc/vz/conf/106.mount:
##########MACRO#0#

/etc/vz/106.unmount:
##########MACRO#1#That's all