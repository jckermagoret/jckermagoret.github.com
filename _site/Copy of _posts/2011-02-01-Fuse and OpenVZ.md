Use Case

To be able to use mount.davfs, I need to install fuse.

My problem is I'm on a virtual machine, based on OpenVZ

Problem

When installing fuse-utils through apt-get, everything went fine but mount.davfs doesn't work and give a short: /sbin/mount.davfs: can't open /dev/fuse

This process works smoothly on a virtual machine based on Fully Virtualized (KVE) but not on an OpenVZ

Diagnostic

In OpenVZ, in contrast with KVE, virtual machines share with host node kernel modules and devices. This means 2 important hings:

the host node must have any module you want to use on virtual machines
the host node must create devices and give permissions to virtual machines to use them
Solution

So, I needed, where $CTID is the container ID:

to install fuse-utils on host node: apt-get install fuse-utils
to install fuse-utils on the required container
to create device on the host node through the following command: vzctl set $CTID --devnodes fuse:rw
And finally, for the new module to be available, restart the container:

vzctl restart $CTID
Problem

The problems you may have are often related to /dev/fuse. You can have:

/sbin/mount.davfs: /dev/fuse: permission denied
/sbin/mount.davfs: can't open /dev/fuse
/SBIN/MOUNT.DAVFS: /DEV/FUSE: PERMISSION DENIED

Your user is generally not in the right group, so add your user into fuse group and chmod 660 /dev/fuse. Ask google, a lot of people had this problem and solved it quickly (see 1).

/SBIN/MOUNT.DAVFS: CAN'T OPEN /DEV/FUSE

You probably first installed fuse on the virtual machine and the /dev/fuse device has so been created by your virtual machine but, as stated before, all kernel modules and devices are shared beetween the host node and containers. You can see it, with the right group and set of permissions, but you can't open it.

You absolutely need to create the device in the Host Node. To do so, just remove it from the container (it means your virtual machine) with a plain "rm /dev/fuse" and create in the host node the corresponding /dev/fuse:

vzctl set $CTID devices c:10:229:rw save
vzctl exec $CTID mknod /dev/fuse c 10 229
If you now look into /etc/vz/conf/$CTID.conf, you will see the following new line:

DEVNODES="fuse:rw "
Restart your container:

vzctl restart $CTID
And, miracle, everything will run smoothly :-)

Resources

1 http://www.nullamatix.com/fixed-fuse-failed-open-dev-fuse-permission-denied/