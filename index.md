---
layout: default
---

{::options parse_block_html="true" /}
<div class='well'>
#Getting Started

The first thing you need to do is get the base image on an SD card and boot up your Raspberry Pi 2 with it. The instructions below assume access to a Mac OS X machine as well as the Raspberry Pi 2.

1. On the Mac download this [linux image](https://images.collabora.co.uk/rpi2/jessie-rpi2-20150202.img.gz) from Sjoerd Simons [blog post](http://sjoerd.luon.net/posts/2015/02/debian-jessie-on-rpi2/).
2. Double-click the .gz file to extract the .img file.
3. Connect the MicroSD card to the Mac and use the "diskutil list" command to determine the device name for it. It will be something like "/dev/disk5". I will refer to it as "/dev/disk#" going forward.
4. Unmount the MicroSD card with `diskUtil unmountDisk /dev/disk#`.
  * At this point, I like to use the finder to confirm that I didn't unmount the wrong disk.
5. Copy the linux image to the microSD card with `sudo dd bs=1m if=<PATH TO IMG FILE> of=/dev/disk#`
  * You will be prompted for your Mac OS X user's password.
6. Wait
  * I like to monitor the activity using Activity Monitor's "Disk" tab and selecting the row for the dd process.
7. You're now ready to insert the microSD card in the Pi and boot it up.

If you have a HDMI monitor and keyboard handy you can interact wth the Pi locally. You should also be able to ssh to the Pi with `ssh root@<IP ADDRESS OF PI>`. You can determine the IP Address of the Pi by login in locally and running `ifconfig`. The default username and password are "root" and "debian". I suggest you immediately change the root password with `chpasswd root:<NEW PASSWORD>`.

You're now ready to start setting up the PDC system:

1. First off install git
  * `apt-get update && apt-get install -y git`
2. Next you need to clone the PDC repo.
  * `git clone https://github.com/mikeholczer/pdc.git`
3. You need to customize the Natman Dockerfile to include the public port to map for ssh access and the local address of your router.
  * I hope to provide a more automated means for this step
  * Edit pdc/Dockerfiles/Natman/Dockerfile and change "12345" to the port you want to port map ssh to and the "192.168.0.1" to the local address of your router.
4. Finally run the setup script
  * `setup.sh`
  * You may need to make it executable first `chmod +x setup.sh`

*The setup script does not yet provide a full setup of the system. Follow the blog for updates on its progress*
</div>
