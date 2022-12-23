#!/bin/bash
sudo yum install -y rpm-build
make srpm
rpmbuild --rebuild yumbootstrap-*.src.rpm
sudo yum localinstall -y --nogpgcheck ~/rpmbuild/RPMS/*/*.rpm

sudo yumbootstrap --verbose centos-6 /mnt/chroot/centos-6
sudo mount --bind /proc /mnt/chroot/centos-6/proc
sudo mount --bind /dev /mnt/chroot/centos-6/dev
sudo cp /etc/resolv.conf /mnt/chroot/centos-6/etc/resolv.conf
