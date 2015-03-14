---
layout: post
title: "Reducing Scope"
date: 2015-03-14 11:30:00 -0400
comments: false
---

The original plan for PDC 1.0 was that it would provide the steps to bootstrap a vanilla linux install on a [Raspberry Pi 
2](http://www.raspberrypi.org/products/raspberry-pi-2-model-b/), install [Docker](http://docker.io) on it and then build up docker 
images and containers to which would provide file syncing through [BitTorrent Sync](http://getsync.com) as well has automated NAT 
port forwarding to ensure remote administration was possible through ssh.

While that is still a goal I have for that project, getting a vanilla linux install that supports kernel features required by 
[Docker](http://docker.io) is taking more time that I had expected, so I am moving that aspect of the project to a later time. The 
initial work on this project is going to use a linux image I found 
[here](http://sjoerd.luon.net/posts/2015/02/debian-jessie-on-rpi2/). Thanks to Sjoerd Simons for providing that.
