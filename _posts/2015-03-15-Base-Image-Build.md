---
layout: post
title: "Base Image Build"
date: 2015-03-15 13:30:00 -0400
comments: true
---

The first thing we need is a base docker image to build the dockerized applications on. Unfortunately, since the armhf archecture of the Raspberry Pi 2 isn't officially supported by [Docker](http://docker.io) or [DockerHub](https://registry.hub.docker.com), we are going to bulid our own.

A new script has been added to the repo based [Dashamir Hoxha](https://independent.academia.edu/DashamirHoxha)'s work on building a [32-bit docker base image](https://github.com/docker-32bit/debian). What it does is use [debootstrap](https://wiki.debian.org/Debootstrap) to create a base minimal debian install in a temp folder and packages it up to be imported into the local docker system. It take a while to run, but does a good job of listed out the tasks it is taking, so you know what is going on.

The docker images we will create to dockerize the applications for PDC will be based on this base image.