#!/bin/bash -x
### Build a docker image for debian  armhf
### based on https://github.com/docker-32bit/debian

### settings
suite=utopic
chroot_dir='/var/chroot/pdcbase'
apt_mirror='http://ports.ubuntu.com/'
docker_image='pdcbase'

### update system
apt-get update && update dist-upgrade -y

### make sure that the required tools are installed
apt-get install -y docker.io debootstrap dchroot

### install a minbase system with debootstrap
debootstrap $suite $chroot_dir $apt_mirror

# Set up initial sources.list
  cat <<EOM >$chroot_dir/etc/apt/sources.list
deb http://ports.ubuntu.com/ ${suite} main restricted universe multiverse
# deb-src http://ports.ubuntu.com/ ${RELEASE} main restricted universe multiverse

deb http://ports.ubuntu.com/ ${suite}-updates main restricted universe multiverse
# deb-src http://ports.ubuntu.com/ ${RELEASE}-updates main restricted universe multiverse

deb http://ports.ubuntu.com/ ${suite}-security main restricted universe multiverse
# deb-src http://ports.ubuntu.com/ ${RELEASE}-security main restricted universe multiverse

deb http://ports.ubuntu.com/ ${suite}-backports main restricted universe multiverse
# deb-src http://ports.ubuntu.com/ ${RELEASE}-backports main restricted universe multiverse
EOM
chroot $chroot_dir apt-get update
chroot $chroot_dir apt-get -y -u dist-upgrade

### cleanup
chroot $chroot_dir apt-get autoclean
chroot $chroot_dir apt-get clean
chroot $chroot_dir apt-get autoremove

### create a tar archive from the chroot directory
tar cfz debian.tgz -C $chroot_dir .

### import this tar archive into a docker image:
cat debian.tgz | docker import - $docker_image

# ### cleanup
rm debian.tgz
rm -rf $chroot_dir
